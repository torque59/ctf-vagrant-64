# -*- mode: ruby -*-
# vi: set ft=ruby :
#
# vagrant ssh-config to create ssh config to ssh without vagrant-ssh.

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.box_version = "20201119.0.0"
  config.vm.provision :shell, :path => "vagrant_bionic.sh", :privileged => false

  # Run if the script does not configure and changes require, useful while debugging.
  #config.vm.provision :shell, :path => "vagrant_bionic.sh", :privileged => false, run: 'always'

  config.ssh.username = 'vagrant'
  config.ssh.forward_agent = true

  config.vm.synced_folder "~/Desktop/Workarea/ctfs/", "/home/vagrant/ctfs"

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "3048"]
  end
end
