#!/bin/bash
echo "Downloading wait-for-it.sh..."
curl -o wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh
chmod +x wait-for-it.sh

echo "Setting up mariadb to listen from any port..."
sed -i "s/^bind-address\s*=\s*.*/bind-address = 0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf
echo "Starting up MariaDB..."
service mariadb start

echo "Waiting for MariaDB to start..."
./wait-for-it.sh mariadb:3306 --timeout=30 --strict -- echo "MariaDB is up and running!"

echo "Creating database and user..."

mysql -e "CREATE DATABASE IF NOT EXISTS wp_db;"
mysql -e "CREATE USER IF NOT EXISTS 'ruined'@'%' IDENTIFIED BY '123';"
mysql -e "GRANT ALL PRIVILEGES ON wp_db.* TO 'ruined'@'%';"
mysql -e "FLUSH PRIVILEGES;"



echo "MariaDB setup completed."
