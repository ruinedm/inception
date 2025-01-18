FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    vsftpd \
    && apt-get clean

COPY ./tools .

RUN chmod +x entrypoint.sh

ENTRYPOINT ["bash", "./entrypoint.sh"]

