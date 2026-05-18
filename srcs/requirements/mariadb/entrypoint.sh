#!/bin/bash

DB_PASSWORD=$(cat /run/secrets/DB_PASSWORD) || { echo "Error: DB_PASSWORD secret not found"; exit 1; }
DB_ROOT_PASSWORD=$(cat /run/secrets/DB_ROOT_PASSWORD) || { echo "Error: DB_ROOT_PASSWORD secret not found" ; exit 1; }

sed -i 's/127.0.0.1/0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

if [ ! -f "/.done" ]; then
	if [ ! -d "/var/lib/mysql/mysql" ]; then
		mysql_install_db --user=mysql --datadir=/var/lib/mysql
	fi

	mysqld_safe --skip-networking &
	PID=$!
	echo "Waiting for MariaDB to start..."
	until mysqladmin ping --silent; do
		sleep 1
	done

	mysql -u root << EOF
CREATE DATABASE IF NOT EXISTS $DB_DB;
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_DB.* TO '$DB_USER'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD';
FLUSH PRIVILEGES;
EOF

	mysqladmin -u root -p"$DB_ROOT_PASSWORD" shutdown
	wait $PID

	touch /.done

fi

echo "MariaDB initialization complete."

exec mysqld_safe