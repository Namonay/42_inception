#!/bin/bash
sleep 10
#Waits for mariadb to be fully operational.
if [ ! -e /var/www/wordpress/wp-config.php ]; then
wp.phar config create    --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb:3306 --path='/var/www/wordpress'
#Create the wp-config.php.
wp.phar core install     --allow-root --url=$URL --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --path='/var/www/wordpress'
#install wordpress using the parameters and configs files.
wp.phar user create      --allow-root --role=author $USER_USER $USER_EMAIL --user_pass=$USER_PASSWORD --path='/var/www/wordpress'
#create an user.

sleep 2
fi
if [ ! -d /run/php ]; then
    mkdir /run/php
    #create the php directory if it's not already created.
fi
/usr/sbin/php-fpm7.3 -F