FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

WORKDIR /usr/local/bin

COPY ./tools/init_mdb.sh .
RUN chmod +x ./init_mdb.sh

EXPOSE 3306

ENTRYPOINT ["./init_mdb.sh"]
CMD ["mysqld_safe"]