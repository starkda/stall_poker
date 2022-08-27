from flask_socketio import emit, join_room
from . import db, socket
from .models import User, Room
from .methods import delete_empty_room, is_json, load_json, check_user, get_jsonified_response


@socket.on('my_event')
def handle_simple_event(message):
    emit('msg', 'recieved data: ' + str(message))


@socket.on('create_room')
def create_room(message):
    if not is_json(message):
        emit('msg', get_jsonified_response('Content must be json!'))
        return
    data = load_json(message)
    if 'login' not in data or 'password' not in data:
        emit('msg', get_jsonified_response('No login or password'))
        return
    check_result = check_user(data['login'], data['password'])
    if not check_result[0]:
        emit('msg', get_jsonified_response(check_result[1]))
        return

    current_room = db.session.query(User.room_id).filter(
        User.login == data['login']).first()[0]
    if current_room is not None:
        emit('msg', get_jsonified_response(
            'You are already in room: ' + str(current_room)))
        return

    new_room = Room()
    if 'time_for_move' in data:
        new_room.time_for_move = data['time_for_move']
    if 'small_blind_bet' in data:
        new_room.small_blind_bet = data['small_blind_bet']
    if 'max_players' in data:
        new_room.max_players = data['max_players']
    if 'is_private' in data:
        new_room.is_private = data['is_private']
    if 'is_with_bots' in data:
        new_room.is_with_bots = data['is_with_bots']
    db.session.add(new_room)
    db.session.commit()

    room_id = new_room.room_id

    user = db.session.query(User).filter(User.login == data['login']).first()
    user.room_id = room_id
    # add user to players_list
    db.session.commit()

    join_room(room_id)

    emit('msg', get_jsonified_response('ok, new room id is: ' + str(room_id)))


@socket.on('join_room')
def join_room(message):
    if not is_json(message):
        emit('msg', get_jsonified_response('Content must be json!'))
        return
    data = load_json(message)
    if 'login' not in data or 'password' not in data:
        emit('msg', get_jsonified_response('No login or password'))
        return
    if 'player_id' not in data:
        emit('msg', get_jsonified_response('Player_id was not specified'))
        return
    check_result = check_user(data['login'], data['password'])
    if not check_result[0]:
        emit('msg', get_jsonified_response(check_result[1]))
        return

    current_room = db.session.query(User.room_id).filter(
        User.login == data['login']).first()[0]
    if current_room is not None:
        emit('msg', get_jsonified_response(
            'You are already in room: ' + str(current_room)))
        return
    room_id = db.session.query(User.room_id).filter(
        User.id == int(data['player_id'])).first()[0]  # potential error
    if room_id is None:
        emit('msg', get_jsonified_response('User not found'))
        return
    # check, that new player does not violate MAX_PLAYERS constraint

    user = db.session.query(User).filter(User.login == data['login']).first()
    user.room_id = room_id
    # add user to players_list
    db.session.commit()

    join_room(room_id)

    emit('msg', get_jsonified_response(
        'successfully joined the room ' + str(room_id)))


# TODO: when should room_id be removed from User?
# TODO: when should room be deleted from table?

@socket.on('leave_room')
def leave_room(message):
    if not is_json(message):
        emit('msg', get_jsonified_response('Content must be json!'))
        return
    data = load_json(message)
    if 'login' not in data or 'password' not in data:
        emit('msg', get_jsonified_response('No login or password'))
        return

    current_room = db.session.query(User.room_id).filter(
        User.login == data['login']).first()[0]
    if current_room is None:
        emit('msg', get_jsonified_response('You are not in any room'))
        return

    user = db.session.query(User).filter(User.login == data['login']).first()
    room_id = user.room_id
    user.room_id = None
    # remove user from players_list
    delete_empty_room(room_id)
    db.session.commit()

    leave_room(room_id)

    emit('msg', 'You leaved room ' + str(room_id))
