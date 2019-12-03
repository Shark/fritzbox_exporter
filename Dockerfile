FROM golang:1.13-alpine
WORKDIR /usr/src/app
ADD . .
RUN go build .
EXPOSE 9133

FROM alpine
COPY --from=0 /usr/src/app/fritzbox_exporter /usr/local/bin/
ENTRYPOINT ["/usr/local/bin/fritzbox_exporter"]

