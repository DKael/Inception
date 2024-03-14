#! /bin/bash

if [ ! -e /run/php ]; then
	mkdir -p /run/php
fi

sed -i 's/listen = \/run\/php\/php8.3-fpm.sock/listen = 9000/g' /etc/php/8.3/fpm/pool.d/www.conf

if [ ! -e /usr/local/bin/wp ]; then
	if [ ! -e /usr/local/bin ]; then
		mkdir -p /usr/local/bin
	fi

	if [ ! -e /var/www/html/wordpress_init_check ]; then
		sed -i -r "s/database_name_here/$MDB_DATABASE/1"   /wp-config.php
		sed -i -r "s/username_here/$MDB_USER/1"  /wp-config.php
		sed -i -r "s/password_here/$MDB_PASSWORD/1"    /wp-config.php
		sed -i -r "s/localhost/$WP_DB_HOST/1"    /wp-config.php
		sed -i -r "s/redis_host_here/$RD_HOST/1"   /wp-config.php
		sed -i -r "s/redis_port_here/$RD_PORT/1"  /wp-config.php
		sed -i -r "s/redis_prefix_here/$RD_PREFIX/1"    /wp-config.php
		sed -i -r "s/redis_database_here/$RD_DATABASE/1"    /wp-config.php

		mv /wp-config.php /var/www/html/wp-config.php

		touch /var/www/html/wordpress_init_check
	fi

	cd /usr/local/bin

	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

	chmod +x wp-cli.phar

	mv wp-cli.phar /usr/local/bin/wp

	cd /var/www/html

	wp core download --allow-root

	wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_NAME --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --allow-root
	
	wp user create $WP_USER_NAME $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD --role=author --allow-root

	wp theme install hello-elementor --activate --allow-root

	wp plugin install redis-cache --activate --allow-root

	wp redis enable --allow-root

	find . ! -path . \! -name ftp_upload -exec chown -R www-data:www-data {} \;

	find . ! -path . \! -name ftp_upload -exec chmod -R 755 {} \;
fi

/usr/sbin/php-fpm8.3 -F