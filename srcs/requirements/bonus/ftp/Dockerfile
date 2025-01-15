FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    vsftpd \
    && apt-get clean

ARG FTP_USER
ARG FTP_PASS

COPY ./tools .

RUN chmod +x setup_ftp.sh && ./setup_ftp.sh

ENTRYPOINT ["vsftpd"]

