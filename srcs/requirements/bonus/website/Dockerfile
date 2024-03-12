# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hyungdki <hyungdki@student.42seoul.kr>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/06 20:54:01 by hyungdki          #+#    #+#              #
#    Updated: 2024/03/12 17:01:31 by hyungdki         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

COPY ./data /var/www/html/website
COPY ./conf/run.sh /

RUN apt update -y \
	&& apt install -y dumb-init \
					vim \
					procps \
					iputils-ping \
					net-tools \
					openssl \
					nodejs \
					npm \
	&& chmod +x /run.sh

CMD ["/usr/bin/dumb-init", "--", "/run.sh"]