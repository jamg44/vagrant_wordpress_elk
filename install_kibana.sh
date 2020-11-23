
# Install Kibana (https://www.elastic.co/guide/en/kibana/7.10/deb.html)

# Download & install
curl -L -O https://artifacts.elastic.co/downloads/kibana/kibana-7.10.0-amd64.deb
sudo dpkg -i kibana-7.10.0-amd64.deb
sudo rm -f kibana-7.10.0-amd64.deb

sudo sed -i 's/#server.host: "localhost"/server.host: "0.0.0.0"/g' /etc/kibana/kibana.yml

sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable kibana.service
sudo systemctl start kibana.service

# Config location: /etc/kibana/kibana.yml
