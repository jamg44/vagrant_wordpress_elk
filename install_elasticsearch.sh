
# Install ElasticSearch (https://www.elastic.co/es/downloads/elasticsearch)

# https://github.com/elastic/elasticsearch-docker/issues/8
# sudo sysctl --w vm.max_map_count=262144

# Download & install
# https://www.elastic.co/guide/en/elasticsearch/reference/7.10/deb.html
curl -L -O https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.10.0-amd64.deb
sudo dpkg -i elasticsearch-7.10.0-amd64.deb
sudo rm -f elasticsearch-7.10.0-amd64.deb

sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable elasticsearch.service
sudo systemctl start elasticsearch.service

# Config location: /etc/elasticsearch/elasticsearch.yml
