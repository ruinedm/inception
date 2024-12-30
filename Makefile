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



fclean: 
	docker system prune -a -f

re: fclean all
