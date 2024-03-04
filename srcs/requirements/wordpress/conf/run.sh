#! /bin/bash

if [ ! -e /var/www/html/wordpress_init_check ] ; then
	mkdir -p /run/php

	cd /var/www/html

	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	
	chmod +x wp-cli.phar
	
	mv wp-cli.phar /usr/local/bin/wp

	wp core download --allow-root

	mv /wp-config.php /var/www/html/wp-config.php

	sed -i -r "s/database_name_here/$MDB_DATABASE/1"   /var/www/html/wp-config.php
	sed -i -r "s/username_here/$MDB_USER/1"  /var/www/html/wp-config.php
	sed -i -r "s/password_here/$MDB_PASSWORD/1"    /var/www/html/wp-config.php
	sed -i -r "s/localhost/$WP_DB_HOST/1"    /var/www/html/wp-config.php
	
	wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_NAME --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --allow-root
	
	wp user create $WP_USER_NAME $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD --role=author --allow-root
	
	sed -i 's/listen = \/run\/php\/php8.3-fpm.sock/listen = 9000/g' /etc/php/8.3/fpm/pool.d/www.conf

	if [ $? -eq 0 ]; then
		touch wordpress_init_check
	fi
fi

/usr/sbin/php-fpm8.3 -F