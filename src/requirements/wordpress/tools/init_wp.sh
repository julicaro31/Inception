#!/bin/sh

# Wait for the database to be ready
echo "Waiting for the database to be ready..."
until mysqladmin ping -h"${MYSQL_DB_HOST}" -u"${MYSQL_USER}" -p"${MYSQL_PASSWORD}" --silent; do
    sleep 2
done
echo "Database is ready. Proceeding with WordPress setup..."

# Ensure WordPress files are present
if [ ! -f wp-config.php ]; then
    echo "No wp-config.php found, creating one..."
    wp config create \
        --dbname="${MYSQL_DATABASE}" \
        --dbuser="${MYSQL_USER}" \
        --dbpass="${MYSQL_PASSWORD}" \
        --dbhost="${MYSQL_DB_HOST}" \
        --allow-root
fi

# Check if WordPress is already installed
if ! wp core is-installed --allow-root; then
    echo "Installing WordPress..."
    wp core install \
        --url="${DOMAIN_NAME}" \
        --title="${WP_TITLE}" \
        --admin_user="${ADMIN_USER}" \
        --admin_password="${ADMIN_PASSWORD}" \
        --admin_email="${ADMIN_EMAIL}" \
        --allow-root
    echo "WordPress installation completed."
else
    echo "WordPress is already installed. Skipping installation."
fi

# Start PHP-FPM in the foreground
php-fpm --nodaemonize

