all:
	docker-compose up

stop:
	docker-compose down

deamon:
	docker-compose up -d

build:
	docker-compose build

clean:
	
	# docker-compose rm
	# docker rmi $(docker images -q)


rebuild: stop build all

clean_volumes:
	docker system prune -a --volumes -f


fclean: clean_volumes stop

delete: 
	docker system prune -a -f

re: fclean all
