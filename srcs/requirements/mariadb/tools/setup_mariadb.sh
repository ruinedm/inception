#!/bin/bash
echo "Downloading wait-for-it.sh..."
curl -o wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh
chmod +x wait-for-it.sh

echo "Setting up mariadb to listen from any port..."
sed -i "s/^bind-address\s*=\s*.*/bind-address = 0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf
echo "Starting up MariaDB..."



echo "MariaDB setup completed."
