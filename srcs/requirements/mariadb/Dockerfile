# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hyungdki <hyungdki@student.42seoul.kr>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/02/27 10:17:21 by hyungdki          #+#    #+#              #
#    Updated: 2024/03/12 17:01:36 by hyungdki         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

COPY ./conf/run.sh /

RUN apt update -y \
	&& apt install -y dumb-init \
					vim \
                    procps \
					iputils-ping \
                    net-tools \
					mariadb-server \
	&& chmod +x /run.sh

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

CMD ["/usr/bin/dumb-init", "--", "/run.sh"]



