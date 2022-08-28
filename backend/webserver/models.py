from webserver import db
from werkzeug.security import generate_password_hash, check_password_hash


class User(db.Model):
    __tablename__ = 'user'
    id = db.Column(db.Integer, primary_key=True)
    login = db.Column(db.Text(), nullable=False, unique=True)
    pwd = db.Column(db.Text(), nullable=False)
    coins = db.Column(db.Integer, nullable=False, default=1000)
    room_id = db.Column(db.Integer, db.ForeignKey(
        'room.room_id', onupdate="CASCADE", ondelete="SET NULL"))

    def __repr__(self):
        return 'User: {} with id:{}'.format(self.login, self.id)

    def check_password(self, password):
        return check_password_hash(self.pwd, password)

    def set_password(self, password):
        self.pwd = generate_password_hash(password)


class Room(db.Model):
    __tablename__ = 'room'
    room_id = db.Column(db.Integer, primary_key=True)
    time_for_move = db.Column(
        db.Integer, nullable=False, default=5)  # in seconds
    small_blind_bet = db.Column(db.Integer, nullable=False, default=10)
    max_players = db.Column(db.Integer, db.CheckConstraint(
        'max_players<6'), nullable=False, default=5)
    # current_players_list = db.Column(db.ARRAY(db.Integer), nullable=False, default=[])
    is_private = db.Column(db.Boolean, nullable=False, default=False)
    is_with_bots = db.Column(db.Boolean, nullable=False, default=False)
