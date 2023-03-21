FROM debian
RUN apt update && apt upgrade && apt install nginx
RUN sed -i 's/ssl_protocols.*/ssl_protocols TLSv1.3;/' /etc/nginx/nginx.conf
CMD ["nginx", "-g", "daemon off;"]
