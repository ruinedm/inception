all:
	docker-compose -f ./srcs/docker-compose.yml up

stop:
	docker-compose -f ./srcs/docker-compose.yml down

deamon:
	docker-compose -f ./srcs/docker-compose.yml up -d

build:
	docker-compose -f ./srcs/docker-compose.yml build


rm: 
	docker system prune -a --volumes -f


clean_volumes:
	sudo rm -rf /home/mboukour/data/wordpress/*
	sudo rm -rf  /home/mboukour/data/mariadb/*

fclean: stop rm clean_volumes

re: fclean all
