ARG POSTGRES_VERSION=13
ARG ALPINE_VERSION=3.17
FROM postgres:${POSTGRES_VERSION}-alpine${ALPINE_VERSION}

RUN apk add --no-cache make

COPY postgresql-evr /tmp/postgresql-evr

RUN make -C /tmp/postgresql-evr install

RUN rm -rf /tmp/postgresql-evr

