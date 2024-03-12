#! /bin/bash

if [ ! -e /etc/nginx/conf.d/default.conf ]; then
  echo "server { 
    listen 443 ssl; 
    listen [::]:443 ssl;

    server_name $DOMAIN_NAME www.$DOMAIN_NAME;
    root /var/www/html;
    index index.php;

    ssl_protocols TLSv1.3;
    ssl_certificate $CERT_FILE;
    ssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;" > /etc/nginx/conf.d/default.conf
    
  echo '
    location /website.html {
      proxy_pass https://website:3000;
      proxy_http_version 1.1;
      proxy_set_header Upgrade $http_upgrade;  
      proxy_set_header Connection '\''upgrade'\'';  
      proxy_set_header Host $host;  
      proxy_cache_bypass $http_upgrade; 
    }

    location /website_files {
        proxy_pass https://website:3000/website_files; # Express 컨테이너의 정적 파일 경로로 변경
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection '\''upgrade'\'';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }

    location /adminer.php {
      try_files $uri =404;
      fastcgi_pass wordpress:8080;
      include fastcgi_params;
      fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    }

    location ~ ^/.+\.php(/|$) {
      try_files $uri =404;
      fastcgi_pass wordpress:9000;
      include fastcgi_params;
      fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    }
}' >> /etc/nginx/conf.d/default.conf
fi

if [ ! -e $CERT_FILE -o ! -e /etc/ssl/private/nginx-selfsigned.key ]; then
  echo "Certification files not exist. Make certification files by certbot"
  openssl req -x509 -nodes -days 365 -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=student/CN=$DOMAIN_NAME" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out $CERT_FILE	
fi

nginx -g "daemon off;"