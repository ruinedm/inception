#!/bin/sh

echo "Generating private key and certificate for nginx"
openssl genrsa -out /etc/ssl/private/sslkey.key 2048
openssl req -new -x509 -key /etc/ssl/private/sslkey.key -out /etc/ssl/certs/sslcert.crt -days 365 -subj "/C=$COUNTRY/ST=$STATE/L=$LOCALITY/O=$ORG/CN=$DOMAIN_NAME"


echo "Setting up domain name in config file..."
envsubst '$DOMAIN_NAME' < /etc/nginx/nginx.conf.temp > /etc/nginx/nginx.conf && rm -f /etc/nginx/nginx.conf.temp