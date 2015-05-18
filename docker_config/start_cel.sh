#!/usr/bin/env bash

cd /code
export C_FORCE_ROOT=true
exec celery worker -A example:app --autoscale=8,1 -B
