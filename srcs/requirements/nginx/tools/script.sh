#!/bin/bash

mkdir -p  etc/nginx/ssl

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/cert.key -out /etc/nginx/ssl/cert.crt -subj "/C=MA/ST=State/L=kh/O=Organization/OU=Organizational Unit/CN=adardour"

sed -i "s/host/${DOMAIN_NAME}/g" /etc/nginx/nginx.conf

nginx