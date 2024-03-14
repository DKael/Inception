# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hyungdki <hyungdki@student.42seoul.kr>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/02/24 22:27:49 by hyungdki          #+#    #+#              #
#    Updated: 2024/03/14 15:22:19 by hyungdki         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all : up

up : 
	@mkdir -p /home/hyungdki/data/wordpress
	@mkdir -p /home/hyungdki/data/mariadb
	@docker compose -f ./srcs/docker-compose.yaml up -d

down : 
	@docker compose -f ./srcs/docker-compose.yaml down -v --rmi all

clear :
	make down
	@rm -rf /home/hyungdki/data

start : 
	@docker compose -f ./srcs/docker-compose.yaml start

stop : 
	@docker compose -f ./srcs/docker-compose.yaml stop

status : 
	@docker ps