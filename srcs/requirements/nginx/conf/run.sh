#! /bin/bash

#openssl req -x509 -nodes -days 365 -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=student/CN=hyungdki.42.fr" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt	

if [ ! -e /etc/nginx/conf.d/$DOMAIN_NAME.conf ]; then
  echo "127.0.0.1 $DOMAIN_NAME www.$DOMAIN_NAME" >> /etc/hosts
  echo "server { 
    listen 80;
    listen [::]:80;
    root /var/www/html;
    index index.nginx-debian.html;
    server_name $DOMAIN_NAME www.$DOMAIN_NAME;
}" > /etc/nginx/conf.d/$DOMAIN_NAME.conf
fi

if [ ! -e $CERT_FILE -o ! -e /etc/letsencrypt/live/$DOMAIN_NAME/privkey.pem ]; then
  echo "Certification files not exist. Make certification files by certbot"
  /usr/bin/certbot --nginx -d $DOMAIN_NAME -d www.$DOMAIN_NAME --non-interactive --agree-tos --register-unsafely-without-email
fi

# echo "server { 
#   listen 443 ssl; 
#   listen [::]:443 ssl; 

#   server_name $DOMAIN_NAME www.$DOMAIN_NAME; 
#   root /var/www/html; 
#   index index.nginx-debian.html; 

#   ssl_certificate $CERT_FILE;
#   ssl_certificate_key /etc/letsencrypt/live/$DOMAIN_NAME/privkey.pem; 

#   ssl_protocols TLSv1.3; 
# }" > /etc/nginx/conf.d/default.conf

nginx -g "daemon off;"