FROM debian

RUN apt-get update && apt-get install -y mariadb-server

# Copy the configuration file
COPY my.cnf /etc/mysql/conf.d/my.cnf

EXPOSE 3306

# Start the MariaDB server
CMD ["mysqld"]
