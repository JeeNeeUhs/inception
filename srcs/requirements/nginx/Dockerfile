FROM		debian:bookworm

RUN			apt-get update && apt-get install -y nginx openssl

COPY		./default.conf /
COPY		./entrypoint.sh /

# EXPOSE		80

ENTRYPOINT	["/entrypoint.sh"]
