# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hyungdki <hyungdki@student.42seoul.kr>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/02/24 18:48:24 by hyungdki          #+#    #+#              #
#    Updated: 2024/02/28 15:22:55 by hyungdki         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

COPY ./conf/run.sh /

RUN apt update -y \
  && apt install -y dumb-init \
                    vim \
                    procps \
                    dnsutils \
                    iputils-ping \
                    net-tools \
                    nginx \
                    openssl \
  && chmod +x /run.sh

CMD ["/usr/bin/dumb-init", "--", "/run.sh"]