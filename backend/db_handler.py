from werkzeug.security import generate_password_hash, check_password_hash
import sqlite3

class DBHandler:
    def __init__(self, db):
        self.__db = db
        self.__cursor = db.cursor()

    def addUser(self, login, password):
        data = dict()
        try:
            script_1 = '''SELECT COUNT(*) FROM users WHERE login = ?;'''
            self.__cursor.execute(script_1, (login,))
            user_cnt = self.__cursor.fetchone()[0]
            if user_cnt > 0:
                return (False, {'msg':'User already exists'})

            hash = generate_password_hash(password)
            script_2 = '''INSERT INTO users (login, password, coins) VALUES (?, ?, ?);'''
            self.__cursor.execute(script_2, (login, hash, 1000,))
            self.__db.commit()

            script_3 = '''SELECT id, coins FROM users WHERE login = ?;'''
            self.__cursor.execute(script_3, (login,))
            data = dict(self.__cursor.fetchone())
        except sqlite3.Error as e:
            return (False, {'msg' : 'Error accessing database: ' + str(e)})
        return (True, {'msg':'Registration successful', 'data' : data})

    def loginUser(self, login, password):
        data = dict()
        try:
            script_1 = '''SELECT COUNT(*) FROM users WHERE login = ?;'''
            self.__cursor.execute(script_1, (login,))
            user_cnt = self.__cursor.fetchone()[0]
            if user_cnt == 0:
                return (False, {'msg':'User not found'})

            script_2 = '''SELECT password FROM users WHERE login = ?;'''
            self.__cursor.execute(script_2, (login,))
            db_hash = self.__cursor.fetchone()[0]
            if not check_password_hash(db_hash, password):
                return (False, {'msg':'Wrong password'})

            script_3 = '''SELECT id, coins FROM users WHERE login = ?;'''
            self.__cursor.execute(script_3, (login,))
            data = dict(self.__cursor.fetchone())
        except sqlite3.Error as e:
            return (False, {'msg':'Error accessing database: ' + str(e)})
        return (True, {'msg':'Login successful', 'data':data})