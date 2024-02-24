# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hyungdki <hyungdki@student.42seoul.kr>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/02/24 18:48:24 by hyungdki          #+#    #+#              #
#    Updated: 2024/02/25 01:01:54 by hyungdki         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

RUN apt update -y \
	&& apt install -y nginx openssl dumb-init vim procps
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=student/CN=hyungdki.42.fr" \
	-keyout /etc/ssl/private/nginx-selfsigned.key -out "$CERT_FILE"
	
RUN echo "server { \
  listen 443 ssl; \
  listen [::]:443 ssl; \
\
  server_name $DOMAIN_NAME; \
  root /var/www/$DOMAIN_NAME/public; \
\
  ssl_certificate $CERT_FILE; \
  ssl_certificate_key /etc/ssl/private/nginx-selfsigned.key; \
\
  ssl_protocols TLSv1.3; \
}" > /etc/nginx/conf.d/default.conf

ENTRYPOINT ["/usr/bin/dumb-init", "--", "nginx", "-g", "daemon off;"]