# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hyungdki <hyungdki@student.42seoul.kr>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/05 16:58:10 by hyungdki          #+#    #+#              #
#    Updated: 2024/03/13 22:30:34 by hyungdki         ###   ########.fr        #
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
					openssl \
					wget \
	 				vsftpd \
	&& wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \  
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz
	&& chmod +x /run.sh

CMD ["/usr/bin/dumb-init", "--", "/run.sh"]