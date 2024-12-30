FROM debian:stable

RUN apt-get update && \
    apt-get install -y \
    php-fpm \
    php-mysql \
    php-cli \
    php-curl \
    php-json \
    php-gd \
    php-mbstring \
    php-xml \
    php-zip \
    curl \
    && apt-get clean
COPY . .

RUN chmod +x ./setup_wordpress.sh
RUN chmod +x ./entrypoint.sh
RUN ./setup_wordpress.sh

EXPOSE 9000

ENTRYPOINT ["./entrypoint.sh"]