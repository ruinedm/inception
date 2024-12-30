#!/bin/sh


./wait-for-it.sh mariadb:3306 --timeout=30 --strict -- echo "MariaDB is up and running"


# we will be using volumes to store the wordpress files, so we need to check if the files are already there
if [ ! -f "/var/www/html/wp-config.php" ]; then
    echo "Downloading and setting up WordPress..."
    wp core download --path=/var/www/html --allow-root
    wp config create --dbname=wp_db --dbuser=ruined --dbpass=123 --dbhost=mariadb --allow-root --path=/var/www/html
    wp core install --url=http://localhost --title="ruined" --admin_user=ruined --admin_password=123 --allow-root --path=/var/www/html
    wp user create user user@gmail.com --role=author --user_pass=123 --allow-root --path=/var/www/html
else
    echo "WordPress already configured LOL"
fi
echo "Starting php-fpm..."
php-fpm8.2 -F