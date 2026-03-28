FROM		debian:bookworm

RUN			apt-get update && apt-get install -y nginx openssl \
			&& rm -rf /var/lib/apt/lists/*

COPY		./default.conf /
COPY		./entrypoint.sh /
RUN			chmod +x /entrypoint.sh

# EXPOSE		443

ENTRYPOINT	["/entrypoint.sh"]
