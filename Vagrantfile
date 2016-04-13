# -*- mode: ruby -*-

Vagrant.configure(2) do |config|
  config.vm.box = "centos/7"
  config.vm.network "private_network", ip: "172.28.128.3"
  config.vm.provision "init", type: "shell", path: "init.sh"
end
