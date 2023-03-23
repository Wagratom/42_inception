FROM debian
RUN apt-get  update && apt-get install -y nginx

RUN sed -i 's/ssl_protocols.*/ssl_protocols TLSv1.3;/' /etc/nginx/nginx.conf
COPY my.conf /etc/nginx/conf.d/

EXPOSE 443
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
