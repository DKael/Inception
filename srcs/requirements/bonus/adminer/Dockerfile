# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hyungdki <hyungdki@student.42seoul.kr>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/06 20:54:01 by hyungdki          #+#    #+#              #
#    Updated: 2024/03/12 17:01:01 by hyungdki         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

COPY ./conf/run.sh /

RUN apt -y update \
	&& apt install -y ca-certificates apt-transport-https software-properties-common lsb-release curl \
	&& curl -sSL https://packages.sury.org/php/README.txt | bash -x \
 	&& apt update -y \
	&& apt install -y dumb-init \
					vim \
                    procps \
					iputils-ping \
                    net-tools \
					wget \
					php8.3 \
					php8.3-mysql \
					php8.3-fpm \
	&& chmod +x /run.sh

CMD ["/usr/bin/dumb-init", "--", "/run.sh"]