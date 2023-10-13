FROM debian:buster

RUN apt-get update && apt install -y nginx openssl

COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf

COPY ./tools/script.sh .

RUN chmod +x script.sh

EXPOSE 443

ENTRYPOINT [ "./script.sh" ]