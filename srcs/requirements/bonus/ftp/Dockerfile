# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hyungdki <hyungdki@student.42seoul.kr>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/05 16:58:10 by hyungdki          #+#    #+#              #
#    Updated: 2024/03/14 14:14:39 by hyungdki         ###   ########.fr        #
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
	&& chmod +x /run.sh

CMD ["/usr/bin/dumb-init", "--", "/run.sh"]