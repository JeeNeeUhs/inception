all:up

up: 
	docker compose -f srcs/docker-compose.yml up -d --build

down:
	docker compose -f srcs/docker-compose.yml down

clean:
	docker compose -f srcs/docker-compose.yml down -v

fclean: clean
	rm -rf /home/ahekinci/data/mariadb/
	rm -rf /home/ahekinci/data/wordpress/

re: clean up

.PHONY: all up down clean re