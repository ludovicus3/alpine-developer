ARG ALPINE_VERSION=3.17
FROM quay.io/ludovicus/alpine-developer:base

RUN curl -sSL https://get.rvm.io | bash -s stable
