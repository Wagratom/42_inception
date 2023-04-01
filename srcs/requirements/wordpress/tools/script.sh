#!/bin/bash
sleep 5
wp core config --dbhost=$WORDPRESS_DB_HOST --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --allow-root --path=/var/www/html/wordpress
wp core install --url=https://wwallas.42.fr:4343 --title=42SP --admin_name=$ADM_NAME --admin_password=$ADM_PASSWORD --admin_email=$ADM_EMAIL --allow-root --path=/var/www/html/wordpress
wp user create joao $USER_EMAIL --role=author --user_pass=$USER_PASSWORD --allow-root --path=/var/www/html/wordpress
php-fpm7.3 -F
