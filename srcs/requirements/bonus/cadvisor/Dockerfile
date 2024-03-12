# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hyungdki <hyungdki@student.42seoul.kr>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/05 16:58:10 by hyungdki          #+#    #+#              #
#    Updated: 2024/03/12 22:03:10 by hyungdki         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

RUN apt update -y \
	&& apt install -y dumb-init \
					vim \
					procps \
					iputils-ping \
					net-tools \
					wget \
	&& wget https://github.com/google/cadvisor/releases/download/v0.39.2/cadvisor \
	&& chmod +x cadvisor

CMD ["/usr/bin/dumb-init", "--", "./cadvisor"]