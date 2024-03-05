# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hyungdki <hyungdki@student.42seoul.kr>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/05 11:16:12 by hyungdki          #+#    #+#              #
#    Updated: 2024/03/05 16:00:27 by hyungdki         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

RUN apt update -y \
	&& apt install -y dumb-init \
					vim \
					procps \
					dnsutils \
					iputils-ping \
					net-tools \
	 				redis-server \
	&& echo "maxmemory  256mb" >> /etc/redis/redis.conf \
	&& echo "maxmemory-policy  allkeys-lfu" >> /etc/redis/redis.conf \
	&& sed -i -r "s/bind 127.0.0.1/bind 0.0.0.0/" /etc/redis/redis.conf

CMD ["/usr/bin/dumb-init", "--", "redis-server",  "--protected-mode", "no"]