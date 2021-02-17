FROM debian:10-slim

RUN apt-get update && apt-get install -y wget mariadb-client

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
 && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
 && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

ENV MYSQL_HOST=mysql
ENV MYSQL_PORT=3306
ENV TIMEOUT=60
ENV MYSQL_USER=root
ENV MYSQL_PASSWORD=root
ENV SQL="source /sql/dump.sql"

WORKDIR /sql

COPY client.sh /usr/local/bin/mysql-client
RUN chmod +x /usr/local/bin/mysql-client

ENTRYPOINT dockerize -wait tcp://${MYSQL_HOST}:${MYSQL_PORT} -timeout ${TIMEOUT}s \
  mysql-client "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`" \
  && mysql-client "${SQL}" ${MYSQL_DATABASE}