# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hyungdki <hyungdki@student.42seoul.kr>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/02/24 22:27:49 by hyungdki          #+#    #+#              #
#    Updated: 2024/03/04 20:08:53 by hyungdki         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all : up

up : 
	@docker-compose -f ./srcs/docker-compose.yaml up -d

down : 
	@docker-compose -f ./srcs/docker-compose.yaml down -v --rmi all

start : 
	@docker-compose -f ./srcs/docker-compose.yaml start

stop : 
	@docker-compose -f ./srcs/docker-compose.yaml stop

status : 
	@docker ps