FROM		debian:bookworm

RUN			apt-get update && apt-get install -y \
			curl \
			tar \
			php \
			php-cli \
			php-mysql \
			php-fpm

RUN			curl -O https://wordpress.org/latest.tar.gz
RUN			tar -xvf latest.tar.gz
RUN			rm -rf latest.tar.gz
RUN			mv wordpress /var/www/html

COPY		./entrypoint.sh /

EXPOSE		9000

ENTRYPOINT	["/entrypoint.sh"]
