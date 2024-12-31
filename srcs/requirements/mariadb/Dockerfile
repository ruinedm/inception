FROM debian:stable

RUN apt-get update && apt-get install -y mariadb-server && apt-get clean 

COPY . . 

RUN chmod +x setup_mariadb.sh && ./setup_mariadb.sh

EXPOSE 3306

ENTRYPOINT ["mariadbd", "--user=mysql", "--console"]