virtualenv venv
source venv/bin/activate
pip install psycopg2 pillow django==1.8.* gunicorn
deactivate
