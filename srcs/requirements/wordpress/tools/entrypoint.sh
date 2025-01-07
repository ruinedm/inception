#!/bin/sh


./wait-for-it.sh mariadb:3306 --timeout=30 --strict -- echo "MariaDB is up and running"


if [ ! -f "/var/www/html/wp-config.php" ]; then
    echo "Downloading and setting up WordPress..."
    cd /var/www/html
    wp core download --allow-root
    wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=mariadb --allow-root 
    wp core install --url=http://localhost --title=$WEBSITE_NAME --admin_user=$ADMIN_USERNAME --admin_password=$ADMIN_PASS --admin_email=$ADMIN_MAIL --allow-root 
    wp user create $USER_USERNAME $USER_MAIL --role=author --user_pass=$USER_PASS --allow-root 
    wp plugin install redis-cache --activate --allow-root
    wp config set WP_REDIS_HOST redis --allow-root
    wp config set WP_REDIS_PORT 6379 --allow-root
    wp redis enable --allow-root
fi


echo "Starting php-fpm..."
php-fpm7.4 -F