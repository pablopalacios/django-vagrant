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

# configures database connection
sed -i  "/django.db.backends.sqlite3/ c\        'ENGINE': 'django.db.backends.postgresql'," settings.py
sed -i  "/'db.sqlite3'/               c\        'NAME': 'vagrant',"                         settings.py
sed -ie "/backends.postgresql/        a\        'PASSWORD': 'vagrant',"                     settings.py
sed -ie "/backends.postgresql/        a\        'USER': 'vagrant',"                         settings.py

# runs first migration
cd ~/src
./manage.py migrate

deactivate
