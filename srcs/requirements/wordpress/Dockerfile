FROM debian:buster

RUN apt update && apt install -y \
	php7.3-fpm\
	php7.3-mysqli \
	mariadb-client \
	wget \
	curl \
	unzip

# Dowload wp cli para realizar comandos wordpress via linha de comando

# Dowload wordpress troca o wordpress.zap
RUN wget https://wordpress.org/wordpress-6.1.zip
RUN unzip wordpress-6.1.zip
RUN rm -f wordpress-6.1.zip

# Dowload wp cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /bin/wp && wp cli update

# Criando a pasta do wordpress
RUN mkdir -p var/www/html/wordpress

# Baixando o wordpress pelo wp cli
RUN wp core download --allow-root --path=/var/www/html/wordpress

# Mudando as permissoes, users e grupos
RUN chown -R www-data:www-data /var/www/html/
RUN chmod -R 774 /var/www/html/

# Colocando o PHP-FPM pra rodar na porta 9000
RUN sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 0.0.0.0:9000/' /etc/php/7.3/fpm/pool.d/www.conf

# Criando o diretorio aonde vai rodar o PHP-FPM
RUN mkdir -p /run/php && chmod 777 /var/run/php
#COPY ./conf/wp-config.php /var/www/html/wordpress/
COPY script.sh ./script.sh
RUN chmod 777 script.sh
#&& chmod 777 /var/www/html/wordpress/wp-config.php

EXPOSE 9000

CMD ["bash", "./script.sh"]
