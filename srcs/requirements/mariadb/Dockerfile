FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

EXPOSE 3306

WORKDIR /usr/local/bin

COPY ./tools/init_mdb.sh .
RUN chmod +x ./init_mdb.sh

CMD ["init_mdb.sh", "mysqld_safe"]