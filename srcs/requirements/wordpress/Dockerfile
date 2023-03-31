FROM debian:buster

RUN apt update && apt install -y \
	php7.3-fpm\
	php7.3-mysqli \
	mariadb-client \
	wget \
	curl \
	unzip

# Dowload wp cli para realizar comandos wordpress via linha de comando
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

# Dowload wordpress troca o lastet.zap
RUN wget https://wordpress.org/latest.zip
RUN unzip latest.zip
RUN rm -f latest.zip

# Movendo o wordpress e cpoiando a configuração para o diretorio dele
RUN mkdir -p var/www/html/
RUN mv wordpress /var/www/html
RUN chown -R www-data:www-data /var/www/html/
RUN chmod -R 774 /var/www/html/
COPY conf/wp-config.php /var/www/html/wordpress/wp-config.php

# Colocando o PHP-FPM pra rodar na porta 9000
RUN sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 0.0.0.0:9000/' /etc/php/7.3/fpm/pool.d/www.conf

# Criando o diretorio aonde vai rodar o PHP
RUN mkdir -p /run/php && chmod 777 /var/run/php

EXPOSE 9000
CMD ["php-fpm7.3", "-F"]

