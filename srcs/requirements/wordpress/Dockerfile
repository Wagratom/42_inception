FROM debian:buster

RUN apt update && apt install -y \
	php7.3-fpm\
	php7.3-mysqli \
	wget \
	unzip

RUN wget https://wordpress.org/latest.zip
RUN unzip latest.zip
RUN rm -f latest.zip

RUN mkdir -p var/www/html/
RUN mv wordpress /var/www/html
RUN chown -R www-data:www-data /var/www/html/
RUN chmod -R 774 /var/www/html/
COPY conf/wp-config.php /var/www/html/wordpress/wp-config.php

RUN mkdir -p /run/php && chmod 777 /var/run/php
RUN sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 0.0.0.0:9000/' /etc/php/7.3/fpm/pool.d/www.conf
RUN echo "<h1>Estou dentro do wordpress</h1>" > /var/www/html/index.php

EXPOSE 9000
CMD ["php-fpm7.3", "-F"]

