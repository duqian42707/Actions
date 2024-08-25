FROM alpine:latest

RUN apk add --update \
    bash skopeo \
  && rm -rf /var/cache/apk/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
