FROM debian:bullseye

# Install NGINX and OpenSSL
RUN apt-get update && apt-get install -y nginx openssl && apt-get clean

# Generate self-signed SSL certificate
RUN mkdir -p /etc/nginx/ssl && \
    openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
    -subj "/C=NL/ST=North Holland/L=Amsterdam/O=Codam/CN=jcaro.42.fr" \
    -out /etc/nginx/ssl/server.crt \
    -keyout /etc/nginx/ssl/server.key

# Copy custom NGINX configuration into the container
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 443 for HTTPS traffic
EXPOSE 443

# Run NGINX in the foreground
CMD ["nginx", "-g", "daemon off;"]
