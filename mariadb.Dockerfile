FROM docker.io/alpine:3.24 AS alpine-openrc

RUN apk add --no-cache openrc

CMD [ "/sbin/init" ]

FROM alpine-openrc

RUN apk add --no-cache \
    mariadb \
    mariadb-client

RUN rc-update add mariadb default

RUN mariadb-install-db --user=mysql --datadir=/var/lib/mysql

VOLUME /var/lib/mysql
EXPOSE 3306
