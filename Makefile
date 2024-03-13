# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hyungdki <hyungdki@student.42seoul.kr>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/02/24 22:27:49 by hyungdki          #+#    #+#              #
#    Updated: 2024/03/13 19:26:18 by hyungdki         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all : up

up : 
	@mkdir -p ${HOME}/data/wordpress
	@mkdir -p ${HOME}/data/mariadb
	@docker-compose -f ./srcs/docker-compose.yaml up -d

down : 
	@docker-compose -f ./srcs/docker-compose.yaml down -v --rmi all
	@rm -rf ${HOME}/data/wordpress
	@rm -rf ${HOME}/data/mariadb

start : 
	@docker-compose -f ./srcs/docker-compose.yaml start

stop : 
	@docker-compose -f ./srcs/docker-compose.yaml stop

status : 
	@docker ps