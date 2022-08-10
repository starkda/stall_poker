from flask import Flask, request, g, abort, Response
import os
import sqlite3
from db_handler import DBHandler
import json

DATABASE = 'stallpoker_db.db'
DEBUG = True
SECRET_KEY = 'sdfvboisvijdjui9sdfjvsjvs'

app = Flask(__name__)
app.config.from_object(__name__)

app.config.update(dict(DATABASE=os.path.join(app.root_path, 'stallpoker_db.db')))

dbhandler = None

### Database creation
def connect_db():
    conn = sqlite3.connect(app.config['DATABASE'])
    conn.row_factory = sqlite3.Row
    return conn

def create_db():
    db = connect_db()
    with app.open_resource('sq_create.sql', mode='r') as f:
        db.cursor().executescript(f.read())
    db.commit()
    db.close()
###

def get_db():
    if not hasattr(g, 'link_db'):
        g.link_db = connect_db()
    return g.link_db

@app.before_request
def before_request():
    global dbhandler
    db = get_db()
    dbhandler = DBHandler(db)

@app.teardown_request
def close_db(response):
    if hasattr(g, 'link_db'):
        g.link_db.close()


@app.route('/', methods=['GET'])
def index():
    return 'Hi! This is Official StallPoker webserver! Data: ' + str(request.is_json) + ' ' + str(request.headers['Content-Type'])

@app.route('/register', methods=['POST'])
def register():
    if not request.is_json:
        abort(Response(response='Content-Type must be json!', status=500, headers={'Content-Type' : 'text/plain'}))

    data = request.json
    if 'login' not in data or 'password' not in data:
        abort(Response(response='No login or password', status=500, headers={'Content-Type' : 'text/plain'}))

    res = dbhandler.addUser(data['login'], data['password'])
    if res[0]:
        return json.dumps(res[1])
    abort(Response(response=json.dumps(res[1]), status=500, headers={'Content-Type' : 'text/plain'}))

@app.route('/login', methods=['POST'])
def login():
    if not request.is_json:
        abort(Response(response='Content-Type must be json!', status=500, headers={'Content-Type' : 'text/plain'}))

    data = request.json
    if 'login' not in data or 'password' not in data:
        abort(Response(response='No login or password', status=500, headers={'Content-Type' : 'text/plain'}))

    res = dbhandler.loginUser(data['login'], data['password'])
    if res[0]:
        return json.dumps(res[1])
    abort(Response(response=json.dumps(res[1]), status=500, headers={'Content-Type' : 'text/plain'}))

@app.route('/users', methods=['GET'])
def getUserInfobyId():
    id = request.args['id']
    data = dbhandler.getUserDataById(id)
    if (data[0] == False):
        abort(Response(response=json.dumps(data[1]), status=500, headers={'Content-Type': 'text/plain'}))
    else:
        abort(Response(response=json.dumps(data[1]), status=200, headers={'Content-Type': 'text/plain'}))


if __name__ == '__main__':
    app.run(debug=True)