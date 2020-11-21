# Vagrant box to deploy Wordpress & ELK in 2 Ubuntu VMs

This vagrant box installs Wordpress, ELK Stack v7.10.0 (Elasticsearch, Logstash, and Kibana) and Filebeat.

## Prerequisites

- [VirtualBox](https://www.virtualbox.org/)
- [Vagrant](http://www.vagrantup.com/)

## Up and SSH

Edit this files to set the passwords and IPs:

- install_wordpress.sh
- install_filebeat.sh
- install_logstash.sh

To start the vagrant box run:

    vagrant up

To log in to the machines run:

    vagrant ssh elk

or:

    vagrant ssh wp

## Exposed ports

- Wordpress http://localhost:8081
- Elasticsearch http://localhost:9200
- Kibana http://localhost:5601

## Test Filebeat

```sh
cd /etc/filebeat
sudo ./filebeat test config -e
```
