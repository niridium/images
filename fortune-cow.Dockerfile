FROM docker.io/alpine:3.24

RUN apk add --no-cache fortune \
    && \
    apk add \
    --repository https://dl-cdn.alpinelinux.org/alpine/edge/testing \
    --no-cache cowsay \
    && \
    apk add --no-cache bash

ENV PATH=${PATH}:/usr/games

CMD [ "bash", "-c", "fortune | cowsay" ]
