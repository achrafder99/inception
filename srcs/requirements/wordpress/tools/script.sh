#!/bin/bash

if ! wp core is-installed --allow-root; then

    wp core download --allow-root

    mv ./wp_conf.php ./wp-config.php

    sed -i "s/db_/${MYSQL_DB}/g" ./wp-config.php
    sed -i "s/user_/${MYSQL_USER}/g" ./wp-config.php
    sed -i "s/pass_db/${MYSQL_PASSWORD}/g" ./wp-config.php
    sed -i "s/host_/${DB_HOST}/g" ./wp-config.php
    sed -i "s/redis_host/${WP_REDIS_HOST_}/g" ./wp-config.php
    sed -i "s/redis_port/${WP_REDIS_PORT_}/g" ./wp-config.php
    sed -i "s/redis_pass/${WP_REDIS_PASSWORD_}/g" ./wp-config.php

    sleep 5

    wp core install \
        --url="${DOMAIN_NAME}" \
        --title="${TITTLE}" \
        --admin_user="${MYSQL_USER}" \
        --admin_password="${MYSQL_PASSWORD}" \
        --admin_email="${EMAIL}" \
        --skip-email \
        --allow-root

    wp plugin install redis-cache --activate --allow-root

    wp user create "${USER}" "${USER_EMAIL}" --user_pass="${USER_PASS}" --role=subscriber --allow-root

    chown -R www-data:www-data /var/www/html/wp-content

    chmod -R 755 /var/www/html/wp-content/
   
fi

php-fpm7.4 -F