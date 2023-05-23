ARG POSTGRES_VERSION=13
ARG ALPINE_VERSION=3.17
FROM postgres:${POSTGRES_VERSION}-alpine${ALPINE_VERSION}

RUN apk add --no-cache make

COPY postgresql-evr /docker-entrypoint-initdb.d/
COPY init-evr.sh /docker-entrypoint-initdb.d/
RUN chmod +x /docker-entrypoint-initdb.d/init-evr.sh

