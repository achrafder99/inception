#!/bin/bash

sed -i "s/MYSQL_DB/$MYSQL_DB/g" init.sql
sed -i "s/MYSQL_USER/$MYSQL_USER/g" init.sql
sed -i "s/MYSQL_PASSWORD/$MYSQL_PASSWORD/g" init.sql

if [ ! -d /var/lib/mysql/mysql ]; then
  mysql_install_db --user=root
fi

service mariadb start

sleep 5

mysql < init.sql

while ! mysqladmin ping -hmariadb --silent 2>/dev/null; do
  sleep 1
done

service mariadb stop

while mysqladmin ping -hmariadb --silent 2>/dev/null; do
  sleep 1
done

exec mysqld -u mysql