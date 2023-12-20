FROM golang:latest as builder
WORKDIR /src/app

RUN apt-get update && \
    go mod init hello

COPY ./src .
RUN go build fullcycle.go 

FROM alpine:latest
WORKDIR /usr/src/app

COPY --from=builder /src/app/fullcycle .

ENTRYPOINT [ "./fullcycle" ]

