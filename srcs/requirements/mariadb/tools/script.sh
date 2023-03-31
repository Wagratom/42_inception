#!/bin/bash

#Iniciando o servido mysql
service mysql start

# Criando uma nova base de dados em pt br
mysql -e "CREATE DATABASE $MYSQL_DATABASE CHARACTER SET utf8 COLLATE utf8_general_ci"

# Criando um user que nao vai ser local '%' e um password
mysql -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'"

# Dando todos os privilegios para o usuario e para data de base
mysql -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%'"

# Alterando a senha root
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'"
# Dando um update
mysql -e "flush privileges"

#iniciando o serviço em pid 1
mysqld
