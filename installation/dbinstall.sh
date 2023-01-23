#!/bin/sh

PASS_SUFFIX="=="
PASS_LENGTH=20
DB_NAME=""
DB_ROOT_PASSWORD=""
DB_ADMIN_USER=""
DB_ADMIN_USER_PASSWORD=""

read -p "App/Database name (use lowercase and underscore only, eg: healpha_dev): "  DB_NAME
if [ "$DB_NAME" = "" ]; then
    echo "No name for app/database found, please start again."
    exit 0
fi

# Set DB root user password
read -p "Choose MySQL root password (leave blank to auto-generate): "  DB_ROOT_PASSWORD
if [ "$DB_ROOT_PASSWORD" = "" ]; then
    DB_ROOT_PASSWORD=$(openssl rand -base64 48 | cut -c1-$PASS_LENGTH)
    DB_ROOT_PASSWORD=$DB_ROOT_PASSWORD$PASS_SUFFIX
fi

# set DB admin user:
DB_ADMIN_USER="${DB_NAME}_admin"

# Set DB admin user password
read -p "Choose DB admin user password (leave blank to auto-generate): "  DB_ADMIN_USER_PASSWORD
if [ "$DB_ADMIN_USER_PASSWORD" = "" ]; then
    DB_ADMIN_USER_PASSWORD=$(openssl rand -base64 48 | cut -c1-$PASS_LENGTH)
    DB_ADMIN_USER_PASSWORD=$DB_ADMIN_USER_PASSWORD$PASS_SUFFIX
fi

echo "Install reference link: https://itsfoss.com/install-mysql-ubuntu/"
echo "Follow the initial setup following the above link"
echo "DB Details:"
echo "Root Password: $DB_ROOT_PASSWORD"
echo "DB Name: $DB_NAME"
echo "DB Admin User: $DB_ADMIN_USER"
echo "DB Admin Password: $DB_ADMIN_USER_PASSWORD"
printf "***** Copy the above details for future use *****\n\n"

read -p "Do you want to continue with above details (y/n)? " SHOULD_CREATE
if [ "$SHOULD_CREATE" != "y" ]; then
    echo "Process terminated!"
    exit 0
fi

# running following commands to install mysql 
sudo apt update
sudo apt install mysql-server
sudo systemctl start mysql.service

