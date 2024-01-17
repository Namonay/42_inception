DETACH ?= true
DATA_PATH ?= /home/vvaas/data

all:
ifeq ($(DETACH), true)
	docker-compose -f srcs/docker-compose.yml up -d
else
	docker-compose -f srcs/docker-compose.yml up
endif

clean:
	docker-compose -f srcs/docker-compose.yml down

fclean:
	-docker stop $$(docker ps -qa)
	-docker rm $$(docker ps -qa)
	-docker rmi -f $$(docker images -qa)
	-docker volume rm $$(docker volume ls -q)
	-docker network rm $$(docker network ls -q) 2>/dev/null
	rm -r $(DATA_PATH)/mariadb/*
	rm -r $(DATA_PATH)/wordpress/*

re: fclean
	docker-compose -f srcs/docker-compose.yml up -d
