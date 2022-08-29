from flask import Blueprint, request, abort

from webserver import db
from webserver.models import User
from .methods import my_abort, check_user, get_jsonified_response

from .constants import *

bp = Blueprint("server", __name__)


@bp.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'GET':
        abort(404)

    if not request.is_json:
        my_abort(MSG_ERR_WRONG_CONTENT_TYPE, CODE_ERR_WRONG_CONTENT_TYPE)
    data = request.json
    if 'login' not in data or 'password' not in data:
        my_abort(MSG_ERR_NO_LOGIN_OR_PASSWORD, CODE_ERR_NO_LOGIN_OR_PASSWORD)

    res = db.session.query(User).filter(User.login == data['login']).all()
    if len(res) > 0:
        my_abort(MSG_ERR_USER_ALREADY_EXISTS, CODE_ERR_USER_ALREADY_EXISTS)

    new_user = User(login=data['login'])
    new_user.set_password(data['password'])
    db.session.add(new_user)
    db.session.commit()

    user_data = dict(db.session.query(User.id, User.coins).filter(
        User.login == data['login']).first())

    return get_jsonified_response(MSG_REGISTER_SUCCESSFUL, CODE_REGISTER_SUCCESSFUL, data=user_data)


@bp.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'GET':
        abort(404)

    if not request.is_json:
        my_abort(MSG_ERR_WRONG_CONTENT_TYPE, CODE_ERR_WRONG_CONTENT_TYPE)
    data = request.json
    if 'login' not in data or 'password' not in data:
        my_abort(MSG_ERR_NO_LOGIN_OR_PASSWORD, CODE_ERR_NO_LOGIN_OR_PASSWORD)

    check_result = check_user(data['login'], data['password'])
    if not check_result[0]:
        my_abort(check_result[1], check_result[2])

    user_data = dict(db.session.query(User.id, User.coins).filter(
        User.login == data['login']).first())
    return get_jsonified_response(MSG_LOGIN_SUCCESSFUL, CODE_LOGIN_SUCCESSFUL, data=user_data)
