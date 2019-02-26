FROM alpine

RUN apk add --no-cache python3 && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 --no-cache-dir install awscli --upgrade pip setuptools && \
    rm -rf /var/cache/apk/*
