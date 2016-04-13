# epel is necessary for IUS repository and other packages (eg. nginx)
# wget is used to grab things from web (eg. ius.rpm)
yum -y install epel-release wget

# IUS is necessary for Python 3.5.
wget https://centos7.iuscommunity.org/ius-release.rpm -O /tmp/ius.rpm
rpm -Uvh /tmp/ius.rpm

# A HTTP server
yum -y install nginx
systemctl enable nginx
systemctl start nginx

# Python 3.5 and pip. Devel package is necessary when using some packages
yum -y install python35u python35u-devel python35u-pip
