#!/bin/sh

if [ "$DATABASE" = "mysql" ]
then
    echo "Waiting for mysql..."

    while ! nc -z $SQL_HOST $SQL_PORT; do
      sleep 0.1
    done

    echo "MySQL started"
fi

python manage.py collectstatic --noinput
python manage.py migrate
gunicorn ecommerce.wsgi:application --bind 0.0.0.0:8000

exec "$@"