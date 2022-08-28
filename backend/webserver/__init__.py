import os

from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
from flask_socketio import SocketIO

db = SQLAlchemy()
migrate = Migrate()
socket = SocketIO()


def create_app():
    app = Flask(__name__)
    db_uri = os.environ.get("DATABASE_URL") or 'sqlite:///' + \
        os.path.join(app.instance_path, 'user_list.sqlite')
    if db_uri.startswith('postgres'):
        db_uri = 'postgresql' + db_uri[len('postgres'):]
    app.config.from_mapping(
        SECRET_KEY=os.environ.get("SECRET_KEY") or "dev_key",
        SQLALCHEMY_DATABASE_URI=db_uri,
        SQLALCHEMY_TRACK_MODIFICATIONS=False,
    )

    db.init_app(app)
    migrate.init_app(app, db)

    from . import routes, events

    app.register_blueprint(routes.bp)

    socket.init_app(app)

    return app

create_app()
