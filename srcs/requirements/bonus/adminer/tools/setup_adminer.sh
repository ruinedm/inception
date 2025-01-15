#!/bin/sh
echo "Downloading wait-for-it.sh..."
curl -o wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh
chmod +x wait-for-it.sh



sed -i "s/^listen\s*=\s*.*/listen = 0.0.0.0:9001/" /etc/php/7.4/fpm/pool.d/www.conf

mkdir -p /run/php
