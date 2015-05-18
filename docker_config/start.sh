#!/usr/bin/env bash

cd /code
(python ./manage.py collectstatic  --noinput)&
(python ./manage.py migrate) &
exec gunicorn -t 150 -w 5 -b 0.0.0.0:8001 example.wsgi:application
