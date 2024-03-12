#! /bin/bash

if [ ! -e /etc/ssl/certs/express-selfsigned.crt -o ! -e /etc/ssl/private/express-selfsigned.key ]; then
  echo "Certification files not exist. Make certification files by certbot"
  openssl req -x509 -nodes -days 365 -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=student/CN=hyungdki.42.fr" -newkey rsa:2048 -keyout /etc/ssl/private/express-selfsigned.key -out /etc/ssl/certs/express-selfsigned.crt
fi

cd /var/www/html/website

if [ ! -e express_init_check ]; then
	npm init -y

	npm install -y express

	touch express_init_check
fi

node server.js