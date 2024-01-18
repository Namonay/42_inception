FROM	debian:buster

RUN		apt update -y
RUN		apt upgrade -y
RUN     apt-get install wget -y
RUN     apt-get install php7.3 -y
RUN     apt-get install php-fpm -y
RUN     apt-get install php-mysql -y
RUN     apt-get install mariadb-client -y
RUN     apt-get install less -y
RUN     apt-get install sendmail -y
RUN     wget https://fr.wordpress.org/latest-fr_FR.tar.gz -P /var/www
#install all dependencies

RUN     cd /var/www && tar -xzf latest-fr_FR.tar.gz && rm latest-fr_FR.tar.gz

COPY    conf/www.conf /etc/php/7.3/fpm/pool.d
# copy the config file in conf into the docker container

RUN     wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN     chmod +x wp-cli.phar
RUN     mv wp-cli.phar /usr/local/bin/wp.phar
#download and install the CLI used in configscript.sh

RUN		chown -R root:root /var/www/wordpress

COPY    tools/configscript.sh configscript.sh
#move the script from conf to the docker container

RUN     chmod +x configscript.sh

EXPOSE 9000

ENTRYPOINT ["bash", "configscript.sh"]
#start the script