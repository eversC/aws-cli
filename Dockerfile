FROM alpine:3.14

# Configure Go
ENV GOROOT /usr/lib/go
ENV GOPATH /go
ENV PATH /go/bin:$PATH

RUN apk --no-cache update && \
    apk add --no-cache ca-certificates python3 go && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 --no-cache-dir install awscli --upgrade pip setuptools && \
    mkdir -p ${GOPATH}/src ${GOPATH}/bin && \
    rm -rf /var/cache/apk/*
