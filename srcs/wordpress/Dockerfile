# Use Debian as the base image
FROM debian:12.7

# Install PHP and required extensions using apt
RUN apt-get update && apt-get install -y \
    php81 \
    php81-fpm \
    php81-mysqli \
    php81-json \
    php81-session \
    && apt-get clean

# Copy the custom PHP configuration file into the container
COPY php.ini /usr/local/etc/php/php.ini

# Expose port 9000 for PHP-FPM
EXPOSE 9000

# Start PHP-FPM in the foreground
CMD ["php-fpm81", "-F"]
