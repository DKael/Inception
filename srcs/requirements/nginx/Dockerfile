# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hyungdki <hyungdki@student.42seoul.kr>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/02/24 18:48:24 by hyungdki          #+#    #+#              #
#    Updated: 2024/02/26 16:44:41 by hyungdki         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

COPY ./conf/run.sh /

RUN apt update -y \
	&& apt install -y nginx openssl dumb-init vim procps python3 python3-venv libaugeas0 \
  && apt remove certbot \
  && python3 -m venv /opt/certbot \
  && /opt/certbot/bin/pip install --upgrade pip \
  && /opt/certbot/bin/pip install certbot certbot-nginx \
  && ln -s /opt/certbot/bin/certbot /usr/bin/certbot \
  && chmod +x /run.sh



CMD ["/usr/bin/dumb-init", "--", "/run.sh"]