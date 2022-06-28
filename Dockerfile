FROM alpine:3.14

COPY --from=golang:1.18-alpine /usr/local/go/ /usr/lib/go/

# Configure Go
ENV GOROOT /usr/lib/go
ENV GOPATH /go
ENV PATH /usr/lib/go/bin:$PATH

RUN apk --no-cache update && \
    apk add --no-cache ca-certificates python3 && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 --no-cache-dir install awscli --upgrade pip setuptools && \
    mkdir -p ${GOPATH}/src ${GOPATH}/bin && \
    rm -rf /var/cache/apk/*
