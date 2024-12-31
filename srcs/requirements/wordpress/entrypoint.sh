#!/bin/sh


./wait-for-it.sh mariadb:3306 --timeout=30 --strict -- echo "MariaDB is up and running"


if [ ! -f "/var/www/html/.wp_installed" ]; then
    echo "Downloading and setting up WordPress..."
    cd /var/www/html
    wp core download --allow-root
    wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=123 --dbhost=mariadb --allow-root 
    wp core install --url=http://localhost --title=$WEBSITE_NAME --admin_user=$ADMIN_USERNAME --admin_password=123 --admin_email=$ADMIN_MAIL --allow-root 
    wp user create $USER_USERNAME $USER_MAIL --role=author --user_pass=123 --allow-root 
    touch .wp_installed
fi


echo "Starting php-fpm..."
php-fpm8.2 -F