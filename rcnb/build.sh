#!/bin/bash

# Exit on error
set -o errexit

# Install dependencies
pip install -r requirements.txt

# Collect static files
python manage.py collectstatic --no-input

# Apply database migrations
# It's good practice to migrate each app individually
# to ensure all dependencies are met.
python manage.py migrate auth
python manage.py migrate contenttypes
python manage.py migrate sessions
python manage.py migrate admin
python manage.py migrate home
python manage.py migrate startups
python manage.py migrate products
python manage.py migrate orders
python manage.py migrate events
python manage.py migrate favorites
python manage.py migrate cart
python manage.py migrate users

# Finally, run migrate again to catch any remaining dependencies
python manage.py migrate