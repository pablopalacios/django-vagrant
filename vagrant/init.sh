# epel is necessary for IUS repository and other packages (eg. nginx)
# wget is used to grab things from web (e.g. ius.rpm)
# gcc is necessary to compile some libraries (e.g. python pyscopg2)
yum -y install epel-release wget gcc

# Image libraries (necessary for pillow)
yum -y install libjpeg-devel zlib-devel libtiff-devel freetype-devel lcms2-devel openjpeg-devel

# IUS is necessary for Python 3.5.
wget https://centos7.iuscommunity.org/ius-release.rpm -O /tmp/ius.rpm
rpm -Uvh /tmp/ius.rpm

# HTTP server
yum -y install nginx
systemctl enable nginx
systemctl start nginx

# PostgreSQL Database
yum -y install postgresql-server postgresql-devel postgresql-contrib
postgresql-setup initdb
## the following is necessary to allow other users connect to db
sed -i 's/ident/md5/' /var/lib/pgsql/data/pg_hba.conf
systemctl enable postgresql
systemctl start postgresql
## prefix db_ is used to facilitate deploy scripts replacements
sudo -u postgres psql -c "CREATE USER db_user WITH PASSWORD 'db_password';"
sudo -u postgres psql -c "CREATE DATABASE db_database;"
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE db_database TO db_user";

# Python 3.5, pip and virtualenv. Devel package is necessary when using some packages
yum -y install python35u python35u-devel python35u-pip
pip3.5 install virtualenv
