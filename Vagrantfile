# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  # config.vm.define "ubuntu1" do |ubuntu1|
  #   ubuntu1.vm.box = "ubuntu/bionic64"
  #   ubuntu1.vm.box_check_update = false
  #   ubuntu1.vm.hostname = "ubuntu1"
  #   ubuntu1.vm.network "private_network", ip: "192.168.100.10", nic_type: "virtio", virtualbox__intnet: "keepcoding"
  #   ubuntu1.vm.network "forwarded_port", guest: 80, host: 8081
  #   ubuntu1.vm.provider "virtualbox" do |vb|
  #     vb.default_nic_type = "virtio"
  #     vb.customize ["modifyvm", :id, "--cpus", "2", "--memory", "512"]
  #   end
  #   ubuntu1.vm.provision :shell, :path => "install_wordpress.sh"
  #   ubuntu1.vm.provision :shell, :path => "install_filebeat.sh"
  #   # ubuntu1.vm.synced_folder ".", "/var/www"
  # end
  config.vm.define "ubuntu2" do |ubuntu2|
    ubuntu2.vm.box = "ubuntu/bionic64"
    ubuntu2.vm.box_check_update = false
    ubuntu2.vm.hostname = "ubuntu2"
    ubuntu2.vm.network "private_network", ip: "192.168.100.11", nic_type: "virtio", virtualbox__intnet: "keepcoding"
    ubuntu2.vm.network "forwarded_port", guest: 80, host: 8082
    ubuntu2.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--cpus", "2", "--memory", "2048"]
      vb.default_nic_type = "virtio"
    end
    ubuntu2.vm.provision :shell, :path => "install_logstash.sh"
end
end
