#!/bin/sh
curl -L https://www.adminer.org/latest.php -o /var/www/adminer/adminer.php

./wait-for-it.sh mariadb:3306 --timeout=30 --strict -- echo "MariaDB is up and running"


php-fpm7.4 -F