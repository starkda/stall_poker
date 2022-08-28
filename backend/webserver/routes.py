from flask import Blueprint, request, abort

from webserver import db
from webserver.models import User
from .methods import my_abort, check_user

bp = Blueprint("server", __name__)


@bp.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'GET':
        abort(404)

    if not request.is_json:
        my_abort('Content-Type must be json!')
    data = request.json
    if 'login' not in data or 'password' not in data:
        my_abort('No login or password')

    res = db.session.query(User).filter(User.login == data['login']).all()
    if len(res) > 0:
        my_abort('User already exists')

    new_user = User(login=data['login'])
    new_user.set_password(data['password'])
    db.session.add(new_user)
    db.session.commit()

    user_data = dict(db.session.query(User.id, User.coins).filter(
        User.login == data['login']).first())

    return {'msg': 'User register successful', 'data': user_data}


@bp.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'GET':
        abort(404)

    if not request.is_json:
        my_abort('Content-Type must be json!')
    data = request.json
    if 'login' not in data or 'password' not in data:
        my_abort('No login or password')

    check_result = check_user(data['login'], data['password'])
    if not check_result[0]:
        my_abort(check_result[1])

    user_data = dict(db.session.query(User.id, User.coins).filter(
        User.login == data['login']).first())
    return {'msg': 'User login successful', 'data': user_data}
