#!/bin/sh
flask db upgrade
exec celery -A app.celery worker  --loglevel=info