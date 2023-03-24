FROM debian:stable-slim

RUN apt-get update && apt-get install -y mariadb-server
RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

EXPOSE 3306
CMD ["mysqld"]
