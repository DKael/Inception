# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hyungdki <hyungdki@student.42seoul.kr>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/02/27 10:17:21 by hyungdki          #+#    #+#              #
#    Updated: 2024/02/28 20:32:10 by hyungdki         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

COPY ./conf/run.sh /
COPY ./conf/wp-config.php /

RUN apt update -y \
	&& apt install -y ca-certificates apt-transport-https software-properties-common lsb-release curl \
	&& curl -sSL https://packages.sury.org/php/README.txt | bash -x \
 	&& apt update -y \
	&& apt install -y dumb-init \
                    vim \
                    procps \
                    dnsutils \
                    iputils-ping \
                    net-tools \
					php8.3 \
					php8.3-curl\ 
					php8.3-imagick \
					php8.3-intl \
					php8.3-mbstring \
					php8.3-mysql \
					php8.3-xml \
					php8.3-zip \
					php8.3-fpm \
	&& chmod +x /run.sh

CMD ["/usr/bin/dumb-init", "--", "/run.sh"]