FROM docker.io/alpine:3 AS alpine-openrc

RUN apk add --no-cache openrc

RUN sed -i '/getty/d' /etc/inittab

CMD [ "/sbin/init" ]

FROM alpine-openrc

RUN apk add --no-cache \
    mariadb \
    mariadb-client

RUN rc-update add mariadb default

RUN mariadb-install-db --user=mysql --datadir=/var/lib/mysql
