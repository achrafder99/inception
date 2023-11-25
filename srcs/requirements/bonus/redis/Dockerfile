FROM debian:bullseye

RUN apt-get update && apt-get install -y redis-server

COPY ./conf/redis.conf /etc/redis/redis.conf

COPY ./tools/script.sh .

RUN chmod +x ./script.sh

EXPOSE 6379

CMD ["./script.sh"]