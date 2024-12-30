FROM debian:stable

RUN apt-get update && apt-get install -y nginx openssl && apt-get clean 



COPY nginx.conf /etc/nginx/nginx.conf

COPY ./setup_nginx.sh setup_nginx.sh

RUN chmod +x setup_nginx.sh && ./setup_nginx.sh



EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]
