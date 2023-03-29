FROM debian:stable-slim

RUN apt update && apt install -y \
	php-fpm \
	wget \
	unzip

RUN wget https://wordpress.org/latest.zip
RUN unzip latest.zip
RUN rm -f latest.zip

RUN mkdir -p var/www/html/
RUN mv wordpress /var/www/html
RUN chown www-data:www-data -R /var/www/html/wordpress 
RUN chmod 777 -R /var/www/html/wordpress
RUN mkdir -p /run/php

EXPOSE 9000
CMD ["php-fpm7.4", "-F"]

