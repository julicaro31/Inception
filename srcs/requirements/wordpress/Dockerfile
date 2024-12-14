# Use Debian as the base image
FROM debian:bullseye

# Install PHP and required extensions for WordPress
RUN apt-get update && apt-get install -y \
    php8.1 \
    php8.1-fpm \
    php8.1-mysqli \
    php8.1-json \
    php8.1-session \
    php8.1-curl \
    php8.1-xml \
    php8.1-mbstring \
    php8.1-gd \
    wget unzip \
    && apt-get clean

# Set up WordPress
RUN mkdir -p /var/www/html && \
    wget https://wordpress.org/latest.zip && \
    unzip latest.zip -d /var/www && \
    rm latest.zip && \
    chown -R www-data:www-data /var/www/html

# Copy the custom PHP configuration file into the container
COPY php.ini /usr/local/etc/php/php.ini

# Expose port 9000 for PHP-FPM
EXPOSE 9000

# Start PHP-FPM in the foreground
CMD ["php-fpm8.1", "-F"]
