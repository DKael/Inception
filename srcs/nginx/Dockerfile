# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hyungdki <hyungdki@student.42seoul.kr>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/02/24 18:48:24 by hyungdki          #+#    #+#              #
#    Updated: 2024/02/25 11:35:03 by hyungdki         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

RUN apt update -y \
	&& apt install -y nginx openssl dumb-init vim procps snapd \
  && snap install core \
  && snap install certbot --classic

COPY ./run.sh /

CMD ["/usr/bin/dumb-init", "--", "/run.sh"]