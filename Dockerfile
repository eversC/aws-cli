FROM alpine:3.9

RUN apk --no-cache update && \
    apk add --no-cache ca-certificates python3 && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 --no-cache-dir install awscli --upgrade pip setuptools && \
    rm -rf /var/cache/apk/*
