FROM	debian:buster

RUN		apt update -y
RUN     apt upgrade -y
RUN		apt install mariadb-server -y
RUN     apt install procps -y

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
#moves the config file from conf to the docker container

COPY tools/mariadb.sh /mariadb.sh
#moves the script inside the docker container

RUN chmod +x /mariadb.sh

EXPOSE 3306

ENTRYPOINT ["/bin/bash", "mariadb.sh"]
