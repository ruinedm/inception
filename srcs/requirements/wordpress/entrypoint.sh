#!/bin/sh


./wait-for-it.sh mariadb:3306 --timeout=30 --strict -- echo "MariaDB is up and running"


if [ ! -d "/var/www/html/wp-config.php" ]; then
    echo "Downloading and setting up WordPress..."
    cd /var/www/html
    wp config create --dbname=wp_db --dbuser=ruined --dbpass=123 --dbhost=mariadb --allow-root 
    wp core install --url=http://localhost --title="ruined" --admin_user=ruined --admin_password=123 --admin_email="dynamicamine@gmail.com" --allow-root 
    wp user create user user@gmail.com --role=author --user_pass=123 --allow-root 
fi


echo "Starting php-fpm..."
php-fpm8.2 -F