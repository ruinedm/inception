FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y \
    php-fpm \
    php-mysqli \
    php-pdo-mysql \
    php-mysql \
    curl \
    && apt-get clean

COPY ./tools .

RUN chmod +x entrypoint.sh setup_adminer.sh && ./setup_adminer.sh

EXPOSE 9001

ENTRYPOINT [ "./entrypoint.sh" ]