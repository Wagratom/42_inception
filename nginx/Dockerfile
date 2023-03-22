FROM debian
RUN apt-get  update &&\
	apt-get install -y nginx

# se eu quiser configurar depos
#COPY nginx.conf /etc/nginx/nginx.conf

RUN sed -i 's/ssl_protocols.*/ssl_protocols TLSv1.3;/' /etc/nginx/nginx.conf
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]
