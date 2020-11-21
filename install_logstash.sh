
# Install Logstash (https://www.elastic.co/es/downloads/logstash)

ELASTIC_SERVER="http://localhost:9200"

# https://github.com/elastic/elasticsearch-docker/issues/8
sudo sysctl --w vm.max_map_count=262144

# Download & install client
curl -L -O https://artifacts.elastic.co/downloads/logstash/logstash-7.10.0-amd64.deb
sudo dpkg -i logstash-7.10.0-amd64.deb
sudo rm -f logstash-7.10.0-amd64.deb

# Setup
cat << EOF | sudo tee /etc/logstash/conf.d/logstash-simple.conf
# Logstash configuration for creating a simple
# Beats -> Logstash -> Elasticsearch pipeline.

input {
  beats {
    port => 5044
  }
}

output {
  elasticsearch {
    hosts => ["$ELASTIC_SERVER"]
    index => "%{[@metadata][beat]}-%{[@metadata][version]}-%{+YYYY.MM.dd}"
    #user => "elastic"
    #password => "changeme"
  }
}
EOF

sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable logstash.service
sudo systemctl start logstash.service

