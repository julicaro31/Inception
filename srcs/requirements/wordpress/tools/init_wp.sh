#!/bin/bash

if [ ! -f "/var/www/html/wp-config.php" ]; then
   mv /tmp/wp-config.php /var/www/html/
fi

sleep 10

wp --allow-root --path="/var/www/html/" core download || true

if ! wp --allow-root --path="/var/www/html/" core is-installed;
then
    wp  --allow-root --path="/var/www/html/" core install \
        --url=$WP_URL \
        --title=$WP_TITLE \
        --admin_user=$WP_ADMIN_USER \
        --admin_password=$WP_ADMIN_PASSWORD \
        --admin_email=$WP_ADMIN_EMAIL
    
    wp  --allow-root --path="/var/www/html/" user create \
        $WP_USER \
        $WP_EMAIL \
        --user_pass=$WP_PASSWORD \
        --role=editor
fi;

wp --allow-root --path="/var/www/html/" theme install raft --activate 

exec $@