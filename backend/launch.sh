#!/bin/bash
source venv/bin/activate
gunicorn -k eventlet webserver:'create_app()'
