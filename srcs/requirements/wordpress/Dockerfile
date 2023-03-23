FROM debian

RUN apt update && apt install -y \
	php7.4-fpm \
	php-mysql \
	php-gd \
	php-curl \
	php-xml \
	php-mbstring \
	php-zip \
	wget \
	unzip

RUN wget https://wordpress.org/latest.tar.gz && \
	tar -xzvf latest.tar.gz && \
	rm -rf latest.tar.gz && \
	mkdir -p /var/www/html && \
	mv wordpress /var/www/html/

RUN mkdir -p /run/php

EXPOSE 9000
CMD ["php-fpm7.4", "-F"]


#COPY php-fpm.conf /etc/php/7.3/fpm/pool.d/php-fpm.conf
#COPY wordpress /var/www/html/wordpress
