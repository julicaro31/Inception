FROM php:8.1-fpm

# Install necessary packages and WP-CLI
RUN apt-get update && apt-get install -y \
    curl \
    tar \
    unzip \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    mariadb-client \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd mysqli \
    && curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
    && curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

# Set working directory
WORKDIR /var/www/html

# Download and extract WordPress
RUN curl -o wordpress.tar.gz https://wordpress.org/latest.tar.gz && \
    tar -xzf wordpress.tar.gz --strip-components=1 && \
    rm wordpress.tar.gz

# Copy the custom wp-config.php file
COPY ./conf/wp-config.php /var/www/html/wp-config.php

# Copy the initialization script
COPY ./tools/init_wp.sh /usr/local/bin/init_wp.sh

# Set permissions for WordPress and wp-config.php
RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html && \
    chown www-data:www-data /var/www/html/wp-config.php && \
    chmod +x /usr/local/bin/init_wp.sh

# Set entrypoint to the initialization script
ENTRYPOINT ["sh", "/usr/local/bin/init_wp.sh"]

# Expose the default PHP-FPM port
EXPOSE 9000
