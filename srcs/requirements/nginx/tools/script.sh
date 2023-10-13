#!/bin/bash

CERT_FILE=$CERTS_/nginx.crt
KEY_FILE=$CERTS_/nginx.key

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $KEY_FILE -out $CERT_FILE -subj "/C=MA/ST=State/L=City/O=Organization/OU=Unit/CN=adardour.42.fr"

nginx -g "daemon off;"
