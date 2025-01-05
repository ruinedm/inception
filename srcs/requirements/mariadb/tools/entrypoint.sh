#!/bin/bash
service mariadb start
./wait-for-it.sh mariadb:3306 --timeout=30 --strict -- echo "MariaDB is up and running!"

echo "Creating database and user..."
if ! mysql -e "SHOW DATABASES LIKE '$DB_NAME';" | grep -q "$DB_NAME"; then
    mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
    mysql -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';"
    mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';"
    mysql -e "FLUSH PRIVILEGES;"
fi
service mariadb stop
echo "Running MariaDB..."
mariadbd --user=mysql --console