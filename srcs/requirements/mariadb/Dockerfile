FROM debian:stable

# RUN apt-get update && apt-get install -y mariadb-server

EXPOSE 3306

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN mkdir -p /var/log/mysql/

RUN chmod -R 777 /var/log/mysql/

COPY ./tools/script.sh .
COPY ./tools/init.sql .

RUN chmod +x ./script.sh

CMD ["./script.sh"]