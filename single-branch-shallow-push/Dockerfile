FROM alpine:latest

COPY setup-ssh.sh /setup-ssh.sh
COPY mirror.sh /mirror.sh
COPY cleanup.sh /cleanup.sh

RUN apk update && apk upgrade && \
    apk add --no-cache git openssh git-lfs && \
    git lfs install && \
    chown root /setup-ssh.sh && \
    chown root /cleanup.sh && \
    chown root /mirror.sh


ENTRYPOINT ["/mirror.sh"]
