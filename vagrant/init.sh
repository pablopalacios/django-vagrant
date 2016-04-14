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

# Python 3.5, pip and virtualenv. Devel package is necessary when using some packages
yum -y install python35u python35u-devel python35u-pip
pip3.5 install virtualenv
