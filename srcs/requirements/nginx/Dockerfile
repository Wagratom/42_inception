FROM debian:stable-slim

RUN apt-get  update && apt-get install -y nginx openssl

RUN openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 \
    -subj "/C=US/ST=State/L=City/O=Organization/CN=localhost" \
    -keyout /etc/nginx/cert.key -out /etc/nginx/cert.crt

RUN sed -i 's/ssl_protocols.*/ssl_protocols TLSv1.3;/' /etc/nginx/nginx.conf
COPY my.conf /etc/nginx/conf.d/

EXPOSE 443
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
