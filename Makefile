all:
	docker-compose -f ./srcs/docker-compose.yml up

stop:
	docker-compose -f ./srcs/docker-compose.yml down

deamon:
	docker-compose -f ./srcs/docker-compose.yml up -d

build:
	docker-compose -f ./srcs/docker-compose.yml build

clean:
	
	# docker-compose rm
	# docker rmi $(docker images -q)


rebuild: stop build all

clean_volumes:
	docker system prune -a --volumes -f
	sudo rm -rf /home/mboukour/data/wordpress/*
	sudo rm -rf  /home/mboukour/data/mariadb/*

fclean: stop clean_volumes

delete: 
	docker system prune -a -f

re: fclean all
