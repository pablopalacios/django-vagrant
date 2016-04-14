# -*- mode: ruby -*-

Vagrant.configure(2) do |config|
  config.vm.box = "centos/7"

  config.vm.network "private_network", ip: "172.28.128.3"
  config.vm.network "forwarded_port", guest: 8000, host: 8000

  config.vm.synced_folder ".", "/home/vagrant/sync", disabled: true
  config.vm.synced_folder "./src", "/home/vagrant/src"
  config.vm.synced_folder "./locale", "/home/vagrant/locale"

  config.vm.provision "clean", type: "shell", path: "./vagrant/clean.sh", privileged: false
  config.vm.provision "init", type: "shell", path: "./vagrant/init.sh"
  config.vm.provision "database", type: "shell", path: "./vagrant/postgresql.sh"
  config.vm.provision "python-modules", type: "shell", path: "./vagrant/python-modules.sh", privileged: false
  config.vm.provision "django", type: "shell", path: "./vagrant/django.sh", privileged: false
  config.vm.provision "createsuperuser", type: "shell", path: "./vagrant/createsuperuser.sh", privileged: false
end
