# !/bin/bash

# NOTE: Because user is not root
export PATH=../.local/bin:$PATH

# NOTE: Don't need to migrate everytime I start during dev
# python3 manage.py makemigrations projects
# python3 manage.py migrate

printf "\n\nCREATING SUPERUSER\n"
python3 manage.py create_super_user

printf "\n\nCOLLECTING STATIC FILES\n"
python3 manage.py collectstatic --noinput

# WARNING: Only use in development!
printf "\n\nSTARTING SERVER IN DEV MODE\n"
gunicorn django_auth_api.wsgi --bind 0.0.0.0:8000 --reload
