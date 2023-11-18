FROM debian:bullseye

RUN apt-get update && apt-get install -y apache2
RUN mkdir -p /var/run/apache2 # Create the directory
RUN sed -i 's#^Mutex file:${APACHE_LOCK_DIR} default#Mutex file:/var/run/apache2 default#' /etc/apache2/apache2.conf # Update Mutex directive
RUN apt clean
RUN apt-get update && apt-get install -y php && apt-get install libapache2-mod-php


RUN mv /var/www/html/index.html /var/www/html/index.php && echo "<?php phpinfo(); ?>" > /var/www/html/index.php

EXPOSE 80
CMD ["apache2", "-D", "FOREGROUND"]
