FROM debian:bullseye

# Install dependencies
RUN apt-get update && apt-get install -y \
    apt-utils \
    curl \
    gnupg \
    lsb-release \
    wget \
    unzip

# Add PHP repository
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list
RUN wget -qO - https://packages.sury.org/php/apt.gpg | apt-key add -

# Install PHP-FPM
RUN apt-get update && apt-get install -y \
    php7.4-fpm \
    php7.4-common \
    php7.4-cli \
    php7.4-curl \
    php7.4-gd \
    php7.4-json \
    php7.4-mbstring \
    php7.4-mysql \
    php7.4-xml \
    php7.4-zip \
    default-mysql-client \
    php7.4-redis

RUN mkdir -p  /run/php

RUN chown www-data:www-data /run/php

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

WORKDIR /var/www/html

RUN chown -R www-data:www-data /var/www/html

RUN chmod -R 755 /var/www/html

RUN wget https://wordpress.org/latest.zip

RUN unzip latest.zip

COPY ./conf/wp-config-sample.php ./wordpress/wp-config.php

RUN mv ./wordpress/* .

RUN rm -rf latest.zip

RUN rm -rf wordpress

COPY ./tools/script.sh .

RUN chmod +x ./script.sh

RUN chown -R www-data:www-data /var/www/html/wp-content

RUN chmod -R 755 /var/www/html/wp-content

EXPOSE 9000

CMD ["./script.sh"]
