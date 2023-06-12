ARG ALPINE_VERSION=3.17
FROM alpine:${ALPINE_VERSION}

ARG USER_NAME=user
ARG HOME=/home/${USER_NAME}

RUN apk add --no-cache bash curl diffutils git git-lfs less vim 

RUN addgroup -g 10001 ${USER_NAME} && \
    adduser -u 10001 -G ${USER_NAME} -h ${HOME} -s /bin/sh -D ${USER_NAME} && \
    chgrp -R 0 ${HOME} && \
    chmod -R g=u ${HOME} /etc/passwd /etc/group

COPY entrypoint.sh /usr/local/bin
RUN chmod a+x /usr/local/bin/entrypoint.sh

USER 10001
WORKDIR /projects
ENTRYPOINT ["entrypoint.sh"]
CMD ["tail", "-f", "/dev/null"]
