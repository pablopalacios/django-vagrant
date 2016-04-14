# PostgreSQL Database
yum -y install postgresql-server postgresql-devel postgresql-contrib
postgresql-setup initdb
## the following is necessary to allow other users connect to db
sed -i 's/ident/md5/' /var/lib/pgsql/data/pg_hba.conf
systemctl enable postgresql
systemctl start postgresql
## creates user and database
sudo -u postgres psql -c "CREATE USER vagrant WITH PASSWORD 'vagrant';"
sudo -u postgres psql -c "CREATE DATABASE vagrant;"
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE vagrant TO vagrant;";
