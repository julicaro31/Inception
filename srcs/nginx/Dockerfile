FROM debian:12.7

# Install NGINX and OpenSSL using apt-get (Debian package manager)
RUN apt-get update && apt-get install -y nginx openssl

# Copy custom NGINX config and SSL certificates into the container
COPY nginx.conf /etc/nginx/nginx.conf
COPY ssl /etc/nginx/ssl

# Expose port 443 for HTTPS
EXPOSE 443

# Run NGINX in the foreground
CMD ["nginx", "-g", "daemon off;"]
