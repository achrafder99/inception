#!/bin/bash

wp core download --allow-root

mv ./wp_conf.php ./wp-config.php

wp core install \
    --url="https://adardour.42.fr" \
    --title="${TITTLE}" \
    --admin_user="${MYSQL_USER}" \
    --admin_password="${MYSQL_PASSWORD}" \
    --admin_email="${EMAIL}" \
    --skip-email \
    --allow-root

wp plugin install redis-cache --activate --allow-root

chown -R www-data:www-data /var/www/html/wp-content

chmod -R 755 /var/www/html/wp-content/

php-fpm7.4 -F