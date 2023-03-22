FROM debian

RUN apt update && apt install -y \
	php-fpm \
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

EXPOSE 9000
CMD ["php-fpm7.3", "-F"]


#COPY php-fpm.conf /etc/php/7.3/fpm/pool.d/php-fpm.conf
#COPY wordpress /var/www/html/wordpress
