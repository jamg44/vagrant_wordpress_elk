# Vagrant box to deploy Wordpress & ELK in 2 Ubuntu VMs

This vagrant box installs Wordpress, Elasticsearch, Logstash, and Kibana.

## Prerequisites

- [VirtualBox](https://www.virtualbox.org/)
- [Vagrant](http://www.vagrantup.com/)

## Up and SSH

Edit this files to set the passwords:

- install_wordpress.sh

To start the vagrant box run:

    vagrant up

To log in to the machine run:

    vagrant ssh
