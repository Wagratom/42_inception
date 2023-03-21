FROM debian
RUN RUN apt-get update && apt-get install -y \
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
