#! /bin/bash

#openssl req -x509 -nodes -days 365 -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=student/CN=hyungdki.42.fr" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt	

certbot --nginx -d $DOMAIN_NAME www.$DOMAIN_NAME

echo "server { 
  listen 443 ssl; 
  listen [::]:443 ssl; 

  server_name $DOMAIN_NAME www.$DOMAIN_NAME; 
  root /var/www/html; 
  index index.nginx-debian.html; 

  ssl_certificate $CERT_FILE;
  ssl_certificate_key /etc/letsencrypt/live/$DOMAIN_NAME/privkey.pem; 

  ssl_protocols TLSv1.3; 
}" > /etc/nginx/conf.d/default.conf

echo "server { 
  if ($host = $DOMAIN_NAME) {
        return 301 https://$host$request_uri;
    }

    listen 80;
    server_name $DOMAIN_NAME www.$DOMAIN_NAME; 
    return 404;
}" >> /etc/nginx/conf.d/default.conf

nginx -g "daemon off;"