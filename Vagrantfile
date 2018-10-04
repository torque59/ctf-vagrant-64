# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "minimal/xenial64"
  config.vm.provision :shell, :path => "vagrant_setup.sh", :privileged => false
  config.ssh.username = 'vagrant'
  config.ssh.forward_agent = true

  config.vm.synced_folder "host-share", "/home/vagrant/host-share"

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end
end
