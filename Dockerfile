FROM alpine

RUN apk --no-cache update && \
  apk --no-cache add python py-pip py-setuptools ca-certificates && \
  pip install --upgrade pip && \
  pip --no-cache-dir install awscli --upgrade && \
  rm -rf /var/cache/apk/*
