# -*- mode: ruby -*-

Vagrant.configure(2) do |config|
  config.vm.box = "centos/7"

  config.vm.network "private_network", ip: "172.28.128.3"
  config.vm.network "forwarded_port", guest: 8000, host: 8000

  config.vm.synced_folder ".", "/home/vagrant/sync", disabled: true
  config.vm.synced_folder ".", "/home/vagrant/project"

  config.vm.provision "init", type: "shell", path: "./vagrant/init.sh"
  config.vm.provision "python-modules", type: "shell", path: "./vagrant/python-modules.sh", privileged: false
end
