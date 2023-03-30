FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server
RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld
RUN echo "port = 3306" >> /etc/mysql/my.cnf
EXPOSE 3306
CMD ["mysqld"]
