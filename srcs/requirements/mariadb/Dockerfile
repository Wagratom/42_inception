FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server mariadb-client
RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld
RUN echo "bind-address = 0.0.0.0" >> /etc/mysql/mariadb.conf.d/50-server.cnf
RUN echo "port = 3306" >> /etc/mysql/mariadb.conf.d/50-server.cnf
#COPY ./conf/mysql.cnf /etc/mysql/conf.d/mysql.cnf
EXPOSE 3306
CMD ["mysqld"]
