# PostgreSQL Database
yum -y install postgresql-server postgresql-devel postgresql-contrib
postgresql-setup initdb
## the following is necessary to allow other users connect to db
sed -i 's/ident/md5/' /var/lib/pgsql/data/pg_hba.conf
systemctl enable postgresql
systemctl start postgresql
## prefix db_ is used to facilitate deploy scripts replacements
sudo -u postgres psql -c "CREATE USER db_user WITH PASSWORD 'db_password';"
sudo -u postgres psql -c "CREATE DATABASE db_name;"
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE db_name TO db_user;";
