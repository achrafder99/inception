#!/bin/bash

sed -i "s/MYSQL_DB/${MYSQL_DB}/g" wp-config.php
sed -i "s/MYSQL_USER/${MYSQL_USER}/g" wp-config.php
sed -i "s/MYSQL_PASSWORD/${MYSQL_PASSWORD}/g" wp-config.php
sed -i "s/WP_REDIS_HOST_/${WP_REDIS_HOST_}/g" wp-config.php
sed -i "s/WP_REDIS_PORT_/${WP_REDIS_PORT_}/g" wp-config.php
sed -i "s/WP_REDIS_PASSWORD_/${WP_REDIS_PASSWORD_}/g" wp-config.php

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

wp core install --url="localhost" --title="${TITTLE}" --admin_user="${MYSQL_USER}" --admin_password="${MYSQL_PASSWORD}" --admin_email="${EMAIL}" --allow-root

wp plugin install redis-cache --activate --allow-root

php-fpm7.4 -F
