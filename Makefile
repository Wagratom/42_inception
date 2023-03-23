# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: wwallas- <wwallas-@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/03/22 10:32:25 by wwallas-          #+#    #+#              #
#    Updated: 2023/03/23 12:49:59 by wwallas-         ###   ########.fr        #
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

init_imgs:
#		initialize mariadb
		@docker build --rm -t $(DB_NAME)_img ./srcs/requirements/mariadb
#		initialize nginx
		@docker build --rm -t $(NGX_NAME)_img ./srcs/requirements/nginx
#		initialize wordpress
		@docker build --rm -t $(WP_NAME)_img ./srcs/requirements/wordpress


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


cleanup: clean_ps clean_network clean_imgs
	docker ps -all
	docker images
	docker network ls
