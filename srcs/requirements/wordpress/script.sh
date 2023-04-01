#!/bin/bash
wp core config --dbhost=$WORDPRESS_DB_HOST --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --allow-root --path=/var/www/html/wordpress
#wp core config --dbhost=mariadb --dbname=wordpress_db --dbuser=www-data --dbpass=EscravoDa42 --allow-root --path=/var/www/html/wordpress
#wp core install --url=https://localhost --title=teste2 --admin_name=wwallas --admin_password=951 --admin_email=testando@gmail.com --allow-root --path=/var/www/html/wordpress
#wp user create joao joao@pedefeijao.com --role=author --user_pass=123 --allow-root --path=/var/www/html/wordpress
php-fpm7.3 -F


--allow-root --path=/var/www/html/wordpress
