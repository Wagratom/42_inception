# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: wwallas- <wwallas-@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/03/22 10:32:25 by wwallas-          #+#    #+#              #
#    Updated: 2023/03/24 18:27:03 by wwallas-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DB_NAME = mariadb
NGX_NAME = nginx
WP_NAME = wordpress
NTW_NAME = wordpress_network

all: init_service

init_service:
	cd srcs && docker-compose up -d --no-recreate --build
	cd ..

restart:
	cd srcs && docker-compose restart
	cd ..
clean_ps:
	docker rm -f $$(docker ps -a | grep $(DB_NAME) | awk '{print $$1}')
	docker rm -f $$(docker ps -a | grep $(NGX_NAME) | awk '{print $$1}')
	docker rm -f $$(docker ps -a | grep $(WP_NAME) | awk '{print $$1}')

clean_network:
	@docker network rm $$(docker network ls | grep $(NTW_NAME) | awk '{print $$1}')

clean_imgs:
	docker rmi -f $$(docker images | grep $(DB_NAME) | awk '{print $$3}')
	docker rmi -f $$(docker images | grep $(NGX_NAME) | awk '{print $$3}')
	docker rmi -f $$(docker images | grep $(WP_NAME) | awk '{print $$3}')

clean_volumes:
	docker volume rm srcs_wordpress_data
#	docker volume rm srcs_mariadb_data

checks:
	@echo "Containers:"
	docker ps -all
	@echo "Images:"
	docker images
	@echo "Networks:"
	docker network ls
	@echo "Volumes:"
	docker volume ls

cleanup: clean_ps clean_network clean_imgs clean_volumes checks

re: cleanup all checks
