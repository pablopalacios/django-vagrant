source ~/venv/bin/activate
# creates super user. Piping method is use to prevent shell prompts
echo "from django.contrib.auth.models import User; User.objects.create_superuser(email='admin@admin.com', username='admin', password='admin')" | ~/src/manage.py shell
deactivate
