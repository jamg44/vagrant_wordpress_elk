
# Install Filebeat (https://www.elastic.co/es/downloads/beats/filebeat)

LOGSTASH_SERVER="192.168.100.2:5044"

# su - vagrant
# wget https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.10.0-linux-x86_64.tar.gz
# tar xvzf filebeat-7.10.0-linux-x86_64.tar.gz
# cd filebeat-7.10.0-linux-x86_64

curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.10.0-amd64.deb
sudo dpkg -i filebeat-7.10.0-amd64.deb

mv /etc/filebeat/filebeat.yml /etc/filebeat/filebeat_original.yml
cat << EOF | sudo tee /etc/filebeat/filebeat.yml
filebeat.inputs:
filebeat.config.modules:
  path: \${path.config}/modules.d/*.yml
  reload.enabled: false
setup.template.settings:
  index.number_of_shards: 1
output.logstash:
  hosts: ["${LOGSTASH_SERVER}"]
processors:
  - add_host_metadata:
      when.not.contains.tags: forwarded
  - add_cloud_metadata: ~
  - add_docker_metadata: ~
  - add_kubernetes_metadata: ~
EOF

sudo filebeat modules enable system apache mysql

sudo service filebeat start
