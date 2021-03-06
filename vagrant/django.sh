# creates a project called project in src
source ~/venv/bin/activate
django-admin startproject project
mv ~/project/* ~/src
rmdir ~/project

# configures static and media files
cd ~/src/project
echo "STATIC_ROOT = os.path.join(BASE_DIR, '../static')" >> settings.py
echo "MEDIA_URL = '/media/'" >> settings.py
echo "MEDIA_ROOT = os.path.join(BASE_DIR, '../media')" >> settings.py

# configures locale directories
echo -e "\nLOCALE_PATHS = [os.path.join(BASE_DIR, '../locale/')]" >> settings.py
echo -e "\nFIXTURE_DIRS = [os.path.join(BASE_DIR, '../fixtures/')]" >> settings.py

# configures database connection
sed -i "s/django.db.backends.sqlite3/django.db.backends.postgresql_psycopg2/" settings.py
sed -i "s/os.path.join(BASE_DIR, 'db.sqlite3')/'vagrant'/" settings.py
sed -i "/backends.postgresql/ a\        'PASSWORD': 'vagrant'," settings.py
sed -i "/backends.postgresql/ a\        'USER': 'vagrant'," settings.py

# runs first migration
cd ~/src
./manage.py migrate

deactivate
