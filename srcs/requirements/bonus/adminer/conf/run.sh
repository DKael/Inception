#!bin/bash

if [ ! -e /run/php ]; then
	mkdir -p /run/php
fi

sed -i 's/listen = \/run\/php\/php8.3-fpm.sock/listen = 8080/g' /etc/php/8.3/fpm/pool.d/www.conf

if [ ! -e /adminer_init_check ]; then
	if [ -e /var/www/html/adminer.php ]; then
		rm /var/www/html/adminer.php
	fi
	wget "http://www.adminer.org/latest.php" -O /var/www/html/adminer.php 

	chown -R www-data:www-data /var/www/html/adminer.php

	chmod 755 /var/www/html/adminer.php

	touch /adminer_init_check
fi

/usr/sbin/php-fpm8.3 -F