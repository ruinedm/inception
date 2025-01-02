FROM debian:stable

RUN apt-get update && apt-get install -y nginx openssl && apt-get clean 



COPY ./tools/nginx.conf /etc/nginx/nginx.conf

COPY ./tools/setup_nginx.sh setup_nginx.sh

RUN chmod +x setup_nginx.sh && ./setup_nginx.sh



EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]
