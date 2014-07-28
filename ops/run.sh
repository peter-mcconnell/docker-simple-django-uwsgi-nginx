#!/bin/bash

# install project deps
pip install -r /var/www/app/requirements.txt

# kickstart django
django-admin.py startproject website /var/www/app/

# start supervisor services
/usr/local/bin/supervisord -n
