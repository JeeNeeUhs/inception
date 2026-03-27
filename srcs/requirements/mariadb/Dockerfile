FROM		debian:bookworm

RUN			sudo apt-get update && sudo apt-get install -y mariadb-server

COPY		./entrypoint.sh /

# EXPOSE		3306

ENTRYPOINT	["/entrypoint.sh"]
