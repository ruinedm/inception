FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    vsftpd \
    && apt-get clean

ARG FTP_USER
ARG FTP_PASS

COPY ./tools .

RUN chmod +x entrypoint.sh

ENTRYPOINT ["bash", "./entrypoint.sh"]

