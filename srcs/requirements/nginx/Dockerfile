FROM debian:bullseye

RUN apt-get update && apt install -y nginx && apt install openssl

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

COPY ./tools/script.sh .

RUN chmod +x ./script.sh

RUN ./script.sh

CMD [ "nginx"]