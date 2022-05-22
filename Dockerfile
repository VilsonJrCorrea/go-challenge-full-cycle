FROM golang:1.18 as builder
WORKDIR /usr/src/app
COPY ./src .
RUN go build main.go


FROM scratch
COPY --from=builder /usr/src/app /usr/src/app
ENTRYPOINT ["/usr/src/app/main"]

