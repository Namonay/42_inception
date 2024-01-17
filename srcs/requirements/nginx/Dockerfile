FROM	debian:buster

RUN		apt update -y
RUN		apt install nginx -y
RUN		apt install openssl -y

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=CM/L=ANgouleme/O=42/OU=42/CN=vvaas/UID=vvaas"
#create a non-encrypted SSL certificate 
COPY conf/nginx.conf /etc/nginx/conf.d
# move the nginx config file in conf into the docker container
RUN chmod +w /var/www/html
RUN chown -R www-data:www-data /var/www/html

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]
#start nginx