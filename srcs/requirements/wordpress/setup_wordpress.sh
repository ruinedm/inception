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
    wp core download --path=/var/www/html --allow-root
fi

