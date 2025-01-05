FROM debian:bullseye

RUN apt update && apt install -y ca-certificates wget lsb-release gnupg && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/sury-php.list && \
    wget -qO - https://packages.sury.org/php/apt.gpg | apt-key add - && \
    apt update && apt install -y php8.2-fpm php8.2-mysql tar && \
    apt clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/php && \
    chown -R www-data:www-data /run/php

COPY conf/www.conf /etc/php/8.2/fpm/pool.d/

RUN wget --no-check-certificate https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /var/www/html/ && \
    chown -R www-data:www-data /var/www/html/

WORKDIR /var/www/html/

COPY ./conf/wp-config.php /tmp/
COPY ./tools/init_wp.sh /bin/
RUN chmod +x /bin/init_wp.sh

EXPOSE 9000

CMD ["init_wp.sh", "php-fpm8.2", "--nodaemonize"]