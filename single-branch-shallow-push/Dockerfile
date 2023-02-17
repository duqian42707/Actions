FROM alpine:3.10

COPY setup-ssh.sh /setup-ssh.sh
COPY mirror.sh /mirror.sh
COPY cleanup.sh /cleanup.sh

RUN apk update && apk upgrade && \
    apk add --no-cache git openssh git-lfs && \
    git lfs install && \
    chmod +x /setup-ssh.sh && \
    chmod +x /cleanup.sh && \
    chmod +x /mirror.sh


ENTRYPOINT ["/mirror.sh"]
