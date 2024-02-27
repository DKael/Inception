# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hyungdki <hyungdki@student.42seoul.kr>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/02/24 18:48:24 by hyungdki          #+#    #+#              #
#    Updated: 2024/02/27 10:04:33 by hyungdki         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

COPY ./conf/run.sh /

RUN apt update -y \
	&& apt install -y nginx openssl dumb-init vim procps dnsutils \
  && chmod +x /run.sh

CMD ["/usr/bin/dumb-init", "--", "/run.sh"]