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

PASSWORD_SU = 9517
DB_NAME = mariadb
NGX_NAME = nginx
WP_NAME = wordpress
NTW_NAME = wordpress_network
PATH_COMPOSE = cd ./srcs
CUR_PATH = cd ..

all: init_service

init_service:
	sudo cat /etc/hosts | sudo grep wwallas.42.fr || sudo  echo  "127.0.0.1       wwallas.42.fr" >> /etc/hosts
	sudo mkdir -p /home/wwallas/wordpress && sudo chmod 777 /home/wwallas/wordpress
	sudo mkdir -p /home/wwallas/mariadb && sudo chmod 777 /home/wwallas/mariadb
	$(PATH_COMPOSE) && docker-compose up -d
	$(CUR_PATH)

rebuild:
	$(PATH_COMPOSE) && sudo docker-compose docker-compose.yml build --no-cache
	$(CUR_PATH)

restart:
	$(PATH_COMPOSE) && docker-compose restart
	$(CUR_PATH)

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
	docker volume rm srcs_mariadb_data

checks:
	@echo "Containers:"
	@docker ps -all
	@echo "\nImages:"
	@docker images
	@echo "\nNetworks:"
	@docker network ls
	@echo "\nVolumes:"
	@docker volume ls

cleanup: clean_ps clean_network clean_imgs clean_volumes checks
	sudo rm -rf /home/wwallas

re: cleanup all checks
