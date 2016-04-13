yum -y install epel-release

yum -y install nginx
systemctl enable nginx
systemctl start nginx
