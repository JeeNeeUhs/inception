FROM		debian:bookworm

RUN		apt-get update && \
		apt-get install -y --no-install-recommends curl ca-certificates \
		php8.2-fpm php8.2-mysql mariadb-client && \
		apt-get clean && \
		rm -rf /var/lib/apt/lists/*

RUN			curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
			&& chmod +x wp-cli.phar \
			&& mv wp-cli.phar /usr/local/bin/wp

COPY		./entrypoint.sh /
RUN			chmod +x /entrypoint.sh

EXPOSE		9000

ENTRYPOINT	["/entrypoint.sh"]
