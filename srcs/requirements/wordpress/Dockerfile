FROM debian:bullseye

EXPOSE 9000

# Define PHP path variable
ARG PHPPATH=/etc/php/8.2/fpm

# Add the Sury PHP repository for PHP 8.2
RUN apt update && apt install --no-install-recommends --no-install-suggests -y \
        ca-certificates \
        wget \
        lsb-release \
        gnupg && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/sury-php.list && \
    wget -qO - https://packages.sury.org/php/apt.gpg | apt-key add - && \
    apt update && apt install --no-install-recommends --no-install-suggests -y \
        php8.2-fpm \
        php8.2-mysql \
        tar && \
    apt clean && rm -rf /var/lib/apt/lists/*

# Ensure the required directory exists
RUN mkdir -p /run/php && \
    chown -R www-data:www-data /run/php

# Copy PHP-FPM configuration
COPY conf/www.conf ${PHPPATH}/pool.d/

# Stop PHP-FPM service (not strictly necessary, but included for parity)
RUN service php8.2-fpm stop

# Configure PHP
RUN sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' ${PHPPATH}/php.ini && \
    sed -i "s/listen = \/run\/php\/php$PHP_VERSION_ENV-fpm.sock/listen = 9000/g" ${PHPPATH}/pool.d/www.conf && \
    sed -i 's/;listen.mode = 0660/listen.mode = 0660/g' ${PHPPATH}/pool.d/www.conf && \
    sed -i 's/;daemonize = yes/daemonize = no/g' ${PHPPATH}/pool.d/www.conf

# Install WP-CLI
RUN wget --no-check-certificate https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

# Set up web root directory
RUN mkdir -p /var/www/html/ && \
    chown -R www-data:www-data /var/www/html/

WORKDIR /var/www/html/

# Copy additional configuration and tools
COPY ./conf/wp-config.php /tmp/
COPY ./tools/init_wp.sh /bin/
RUN chmod +x /bin/init_wp.sh

# Set entrypoint and default command
CMD ["init_wp.sh", "php-fpm8.2", "--nodaemonize"]
