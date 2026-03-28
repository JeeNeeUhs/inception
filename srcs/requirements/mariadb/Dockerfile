FROM		debian:bookworm

RUN			apt-get update && apt-get install -y mariadb-server \
			&& rm -rf /var/lib/apt/lists/*

COPY		./entrypoint.sh /
RUN			chmod +x /entrypoint.sh

# EXPOSE		3306

ENTRYPOINT	["/entrypoint.sh"]