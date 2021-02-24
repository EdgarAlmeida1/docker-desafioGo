FROM golang:alpine AS builder

WORKDIR $GOPATH/src/mylekkepackage/mylekkeapp/
COPY app.go .
RUN GO111MODULE=off go build -o /go/app

FROM scratch

COPY --from=builder /go/app /go/app


CMD ["/go/app"]