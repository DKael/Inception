#! /bin/bash

if [ ! -e /var/run/myslq ]; then
	cd /var/run
	mkdir mysqld
	chown mysql mysqld
	chgrp mysql mysqld
fi

if [ ! -e /init.sql ]; then
	cd /
	echo "CREATE DATABASE IF NOT EXISTS $MDB_DATABASE;" > init.sql
	echo "CREATE USER IF NOT EXISTS '$MDB_USER'@'%' IDENTIFIED BY '$MDB_PASSWORD';" >> init.sql
	echo "GRANT ALL PRIVILEGES ON $MDB_DATABASE.* TO '$MDB_USER'@'%';" >> init.sql
	echo "ALTER USER 'root'@'localhost' IDENTIFIED BY 'hyungdki42';" >> init.sql
	echo "FLUSH PRIVILEGES;" >> init.sql
	service mariadb start
	mysql < /init.sql
	kill $(cat /var/run/mysqld/mysqld.pid)
	echo "Mariadb init done!"
fi

mariadbd
