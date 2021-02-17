#!/bin/bash

if [ -n "${2}" ]; then
    mysql -v -h ${MYSQL_HOST} -u ${MYSQL_USER} -p${MYSQL_PASSWORD} -P ${MYSQL_PORT} -D ${2} -e "${1}"
else
    mysql -v -h ${MYSQL_HOST} -u ${MYSQL_USER} -p${MYSQL_PASSWORD} -P ${MYSQL_PORT} -e "${1}"
fi