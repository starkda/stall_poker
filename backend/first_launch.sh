#!/bin/bash
rm -r venv/
python3 -m venv venv
source venv/bin/activate

pip install -r requirements.txt

rm -r instance/
rm -r migrations/

mkdir instance

flask db init
flask db migrate
flask db upgrade

gunicorn -k eventlet webserver:'create_app()'
