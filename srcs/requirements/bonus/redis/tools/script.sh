#!/bin/bash

sed -i "s/PASS_REDIS/${WP_REDIS_PASSWORD_}/g" /etc/redis/redis.conf

redis-server /etc/redis/redis.conf