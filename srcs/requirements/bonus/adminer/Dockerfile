FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y \
    php \
    php-mysqli \
    php-pdo \
    php-mbstring \
    php-json \
    php-gd \
    php-curl \
    php-xml \
    wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/www/html/adminer \
    && wget -O /var/www/html/adminer/index.php https://www.adminer.org/latest-mysql.php

EXPOSE 8000

CMD ["php", "-S", "0.0.0.0:8000", "-t", "/var/www/html/adminer"]
