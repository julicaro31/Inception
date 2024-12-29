FROM nginx

# Install NGINX and OpenSSL
RUN apt-get update && apt-get install -y nginx openssl && apt-get clean

# Generate self-signed SSL certificate
RUN mkdir -p /etc/nginx/ssl && \
    openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
    -subj "/C=NL/ST=North Holland/L=Amsterdam/O=Codam/CN=jcaro.42.fr" \
    -out /etc/nginx/ssl/jcaro.crt \
    -keyout /etc/nginx/ssl/jcaro.key

# Copy the NGINX configuration file into the container
COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 443 for HTTPS traffic
EXPOSE 443

# Run NGINX in the foreground
CMD ["nginx", "-g", "daemon off;"]