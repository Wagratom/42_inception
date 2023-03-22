# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: wwallas- <wwallas-@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/03/22 10:32:25 by wwallas-          #+#    #+#              #
#    Updated: 2023/03/22 11:30:22 by wwallas-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all: img_nginx img_wordpress img_mariadb

img_nginx:
	@docker build -t nginx_img ./srcs/requirements/nginx

img_wordpress:
	@docker build -t wordpress_img ./srcs/requirements/wordpress

img_mariadb:
	@docker build -t mariadb_img ./srcs/requirements/mariadb

cleanup:
	@docker rmi $$(docker images -q)

make re: cleanup all
