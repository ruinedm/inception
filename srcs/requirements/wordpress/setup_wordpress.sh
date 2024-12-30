#!/bin/sh
echo "Downloading and setting up wp-cli..."
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp 

echo "Downloading wait-for-it.sh..."
curl -o wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh
chmod +x wait-for-it.sh

if [ ! -d "/var/www/html" ]; then
    echo "Downloading and setting up WordPress..."
    mkdir -p /var/www/html
    cd /var/www/html
    wp core download --allow-root
    echo "Configuring PHP to listen on ip and not unix socket..."
    sed -i "s/^listen\s*=\s*.*/listen = 0.0.0.0:9000/" /etc/php/8.2/fpm/pool.d/www.conf
fi
