
# Install Wordpress (https://ubuntu.com/tutorials/install-and-configure-wordpress)

sudo apt-get update
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
sudo apt install -y wordpress php libapache2-mod-php mysql-server php-mysql

# Crear el site de wordpress
cat << EOF | sudo tee /etc/apache2/sites-available/wordpress.conf
Alias /blog /usr/share/wordpress
<Directory /usr/share/wordpress>
    Options FollowSymLinks
    AllowOverride Limit Options FileInfo
    DirectoryIndex index.php
    Order allow,deny
    Allow from all
</Directory>
<Directory /usr/share/wordpress/wp-content>
    Options FollowSymLinks
    Order allow,deny
    Allow from all
</Directory>
EOF

# Crear el site raiz
cat << EOF | sudo tee /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
  <head><meta charset="utf-8"></head>
  <body><h1>Para usar wordpress vaya a <a href="/blog">/blog</a></h1></body>
</html>
EOF

sudo a2ensite wordpress
sudo a2enmod rewrite
sudo service apache2 restart

# Crear la base de datos
mysql -u root -proot -e "CREATE DATABASE wordpress;"
mysql -u root -proot -e "GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,ALTER ON wordpress.* TO wordpress@localhost IDENTIFIED BY 'wordpress';"
mysql -u root -proot -e "FLUSH PRIVILEGES;"

cat << EOF | sudo tee /etc/wordpress/config-localhost.php
<?php
define('DB_NAME', 'wordpress');
define('DB_USER', 'wordpress');
define('DB_PASSWORD', 'wordpress');
define('DB_HOST', 'localhost');
define('DB_COLLATE', 'utf8_general_ci');
define('WP_CONTENT_DIR', '/usr/share/wordpress/wp-content');
?>
EOF

sudo service mysql start
