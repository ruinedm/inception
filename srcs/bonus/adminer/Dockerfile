FROM debian:stable

RUN apt-get update && \
    apt-get install -y \
    php-fpm \
    curl \
    && apt-get clean

COPY ./tools .

RUN chmod +x entrypoint.sh setup_adminer.sh && ./setup_adminer.sh

EXPOSE 900

ENTRYPOINT [ "./entrypoint.sh" ]