# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.define "elk" do |elk|
    elk.vm.box = "ubuntu/bionic64"
    elk.vm.box_check_update = false
    elk.vm.hostname = "elk"
    elk.vm.network "private_network", ip: "192.168.100.11", nic_type: "virtio", virtualbox__intnet: "keepcoding"
    elk.vm.network "forwarded_port", guest: 9200, host: 9200
    elk.vm.network "forwarded_port", guest: 5601, host: 5601
    elk.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--cpus", "2", "--memory", "4096"]
      vb.default_nic_type = "virtio"
    end
    elk.vm.provision :shell, :path => "install_elasticsearch.sh"
    elk.vm.provision :shell, :path => "install_kibana.sh"
    elk.vm.provision :shell, :path => "install_logstash.sh"
  end
  config.vm.define "wp" do |wp|
    wp.vm.box = "ubuntu/bionic64"
    wp.vm.box_check_update = false
    wp.vm.hostname = "wp"
    wp.vm.network "private_network", ip: "192.168.100.10", nic_type: "virtio", virtualbox__intnet: "keepcoding"
    wp.vm.network "forwarded_port", guest: 80, host: 8081
    wp.vm.provider "virtualbox" do |vb|
      vb.default_nic_type = "virtio"
      vb.customize ["modifyvm", :id, "--cpus", "2", "--memory", "512"]
    end
    wp.vm.provision :shell, :path => "install_wordpress.sh"
    wp.vm.provision :shell, :path => "install_filebeat.sh"
    # wp.vm.synced_folder ".", "/var/www"
  end
end
