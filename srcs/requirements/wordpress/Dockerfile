FROM		debian:bookworm

RUN			apt-get update && apt-get install -y \
			curl \
			tar \
			php \
			php-cli \
			php-mysql \
			php-fpm \
			&& rm -rf /var/lib/apt/lists/*

RUN			curl -O https://wordpress.org/latest.tar.gz \
			&& tar -xvf latest.tar.gz \
			&& rm -rf latest.tar.gz \
			&& mv wordpress /var/www/html

RUN			chown -R www-data:www-data /var/www/html

RUN			curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
			&& chmod +x wp-cli.phar \
			&& mv wp-cli.phar /usr/local/bin/wp

COPY		./entrypoint.sh /
RUN			chmod +x /entrypoint.sh

# EXPOSE		9000

ENTRYPOINT	["/entrypoint.sh"]
