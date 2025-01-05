FROM	debian:bullseye

RUN		apt-get update && apt-get install -y nginx openssl && apt-get clean

ARG     DOMAIN_NAME
RUN 	mkdir -p /etc/nginx/ssl && \
		openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
		-subj "/C=NL/ST=North Holland/L=Amsterdam/O=Codam/CN=${DOMAIN_NAME}" \
		-out /etc/nginx/ssl/jcaro.crt \
		-keyout /etc/nginx/ssl/jcaro.key

COPY	conf/nginx.conf     /etc/nginx/

RUN		mkdir -p /var/www/
RUN		chown -R www-data:www-data /var/www/

EXPOSE	443

CMD		["nginx", "-g", "daemon off;"]