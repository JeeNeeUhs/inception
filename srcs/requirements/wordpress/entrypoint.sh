#!/bin/bash

DB_PASSWORD=$(cat /run/secrets/DB_PASSWORD) || {echo "Error: DB_PASSWORD secret not found"; exit 1;}
DB_ROOT_PASSWORD=$(cat /run/secrets/DB_ROOT_PASSWORD) || {echo "Error: DB_ROOT_PASSWORD secret not found"; exit 1;}
WP_PASSWORD=$(cat /run/secrets/WP_PASSWORD) || {echo "Error: WP_PASSWORD secret not found"; exit 1;}
WP_ADMIN_PASSWORD=$(cat /run/secrets/WP_ADMIN_PASSWORD) || {echo "Error: WP_ADMIN_PASSWORD secret not found"; exit 1;}

wp config create \
	--allow-root \
	--path=/var/www/html/wordpress \
	--dbname="${DB_DB}" \
	--dbuser="${DB_USER}" \
	--dbpass="${DB_PASSWORD}" \
	--dbhost=mariadb \

wp core install \
	--allow-root \
	--path=/var/www/html/wordpress \
	--url="https://$DOMAIN_NAME" \
	--title="Inception" \
	--admin_user="${WP_ADMIN_USER}" \
	--admin_password="${WP_ADMIN_PASSWORD}" \
	--admin_email="${WP_ADMIN_EMAIL}" \
	--skip-email

wp user create \
	--allow-root \
	--path=/var/www/html/wordpress \
	"${WP_USER}" \
	"${WP_USER_EMAIL}" \
	--user_pass="${WP_PASSWORD}" \
	--role=author

exec php-fpm -F
