#!/usr/bin/env bash
# exit on error
set -o errexit

pip install -r requirements.txt

if [[-z $CREATE_SUPERUSER]]; then python manage.py createsuperuser fi

python manage.py collectstatic --no-input
python manage.py migrate

