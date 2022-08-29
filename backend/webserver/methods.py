import json
from flask import abort, Response
from .models import User, Room
from . import db
from .constants import *


def is_json(data):
    try:
        json.loads(data)
    except ValueError as e:
        return False
    return True


def load_json(data):
    return json.loads(data)


def my_abort(msg, err_code=None):
    if err_code is None:
        abort(
            Response(
                response=json.dumps({'msg': msg}),
                status=500,
                headers={'Content-Type': 'application/json'},
            )
        )
    else:
        abort(
            Response(
                response=json.dumps({'msg': msg, 'code': err_code}),
                status=500,
                headers={'Content-Type': 'application/json'},
            )
        )


def check_user(login, password):
    data = db.session.query(User).filter(User.login == login).all()
    if len(data) == 0:
        return (False, MSG_ERR_USER_NOT_FOUND, CODE_ERR_USER_NOT_FOUND)
    if not data[0].check_password(password):
        return (False, MSG_ERR_WRONG_PASSWORD, CODE_ERR_WRONG_PASSWORD)
    return (True, )


def get_jsonified_response(msg: str, code=None, **kwargs):
    result = {'msg': msg}
    if code is not None:
        result['code'] = code
    if 'data' in kwargs and len(kwargs) == 1:
        result['data'] = kwargs['data']
    elif len(kwargs) != 0:
        result['data'] = kwargs
    return json.dumps(result)


def delete_empty_room(room_id):
    # TODO
    pass
