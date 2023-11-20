#!/bin/bash

sed -i "s/MYSQL_DB/${MYSQL_DB}/g" wp-config.php
sed -i "s/MYSQL_USER/${MYSQL_USER}/g" wp-config.php
sed -i "s/MYSQL_PASSWORD/${MYSQL_PASSWORD}/g" wp-config.php
sed -i "s/WP_REDIS_HOST/${WP_REDIS_HOST}/g" wp-config.php
sed -i "s/WP_REDIS_PORT/${WP_REDIS_PORT}/g" wp-config.php
sed -i "s/WP_REDIS_PASSWORD/${WP_REDIS_PASSWORD}/g" wp-config.php

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

wp core install --url=https://10.11.100.134 --title=$TITTLE --admin_user=$MYSQL_USER --admin_email=$EMAIL --admin_password=$MYSQL_PASSWORD --allow-root

wp core install --url=https://10.11.100.134 --title="$TITTLE" --admin_user="$MYSQL_USER" --admin_email="$EMAIL" --admin_password="$MYSQL_PASSWORD" --allow-root > install_log.txt 2>&1

if [ $? -ne 0 ]; then
    echo "WordPress installation failed"
else
    echo "WordPress installation successful"
fi

sleep 5

php-fpm7.4 -F