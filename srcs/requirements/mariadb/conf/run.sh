#! /bin/bash

cd /var/run
mkdir mysqld
chown mysql mysqld
chgrp mysql mysqld

mariadbd

echo "CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE ;" > init.sql
echo "CREATE USER IF NOT EXISTS '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD' ;" >> init.sql
echo "GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO '$MARIADB_USER'@'%' ;" >> init.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY 'hyungdki42' ;" >> init.sql
echo "FLUSH PRIVILEGES;" >> init.sql

mariadb < init.sql