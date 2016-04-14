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
cd ~
