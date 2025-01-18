FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y redis-server

EXPOSE 6379

ENTRYPOINT ["redis-server", "--protected-mode", "no"]