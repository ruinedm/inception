#!/bin/sh


./wait-for-it.sh mariadb:3306 --timeout=30 --strict -- echo "MariaDB is up and running"

echo "Starting php-fpm..."
php-fpm8.2 -F