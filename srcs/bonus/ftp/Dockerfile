FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    vsftpd \
    && apt-get clean



COPY ./tools .

RUN chmod +x setup_ftp.sh && ./setup_ftp.sh

CMD ["vsftpd"]
