FROM debian:stable-slim

RUN apt update && apt install -y \
	php-fpm \
	wordpress

RUN mkdir -p /run/php
EXPOSE 9000
CMD ["php-fpm7.4", "-F"]

