DB_EXISTS=$(mysql -u root -e "SHOW DATABASES LIKE '$DB_NAME';")
if [ ! -z "$DB_EXISTS" ]; then
    echo "Setting up the database..."
    mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
    mysql -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';"
    mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';"
    mysql -e "FLUSH PRIVILEGES;"
fi

echo "Running mariadb..."
mariadbd --user=mysql --console