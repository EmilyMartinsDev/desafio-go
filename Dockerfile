FROM golang:1.17.2-alpine3.14 as builder

WORKDIR /usr/app

COPY . .

RUN go mod init main && \
  go build

FROM scratch
WORKDIR /usr/app
COPY --from=builder /usr/app/main .
CMD ["/usr/app/main"]