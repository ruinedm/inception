FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx openssl && apt-get clean 



COPY ./tools/website /var/www/html


COPY ./tools/nginx.conf /etc/nginx/nginx.conf

ENTRYPOINT ["nginx", "-g", "daemon off;"]
