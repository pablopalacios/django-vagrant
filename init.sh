yum -y install epel-release

yum -y install nginx
systemctl enable nginx
systemctl start nginx

yum -y install wget
wget https://centos7.iuscommunity.org/ius-release.rpm -O /tmp/ius.rpm
rpm -Uvh /tmp/ius.rpm
