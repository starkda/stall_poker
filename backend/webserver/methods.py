import json
from flask import abort, Response
from .models import User, Room
from . import db


def is_json(data):
    try:
        json.loads(data)
    except ValueError as e:
        return False
    return True


def load_json(data):
    return json.loads(data)


def my_abort(msg):
    abort(
        Response(
            response=json.dumps({'msg': msg}),
            status=500,
            headers={'Content-Type': 'application/json'},
        )
    )


def check_user(login, password):
    data = db.session.query(User).filter(User.login == login).all()
    if len(data) == 0:
        return (False, 'User not found')
    if not data[0].check_password(password):
        return (False, 'Wrong password')
    return (True, 'Success')


def get_jsonified_response(msg: str, **kwargs):
    if len(kwargs) == 0:
        return json.dumps({'msg': msg})
    else:
        return json.dumps({'msg': msg, 'data': kwargs})


def delete_empty_room(room_id):
    # TODO
    pass
