FROM ubuntu:22.04 as builder
RUN apt-get update && apt install --yes golang libpcap-dev openssl ca-certificates

RUN mkdir -p /app/
WORKDIR /app/

RUN go mod init m.test
ARG CERT_LOCATION=/usr/local/share/ca-certificates
RUN mkdir -p ${CERT_LOCATION}
RUN openssl s_client -showcerts -connect github.com:443 </dev/null 2>/dev/null|openssl x509 -outform PEM > ${CERT_LOCATION}/github.crt
RUN openssl s_client -showcerts -connect proxy.golang.org:443 </dev/null 2>/dev/null|openssl x509 -outform PEM >  ${CERT_LOCATION}/proxy.golang.crt
RUN update-ca-certificates
RUN go get github.com/fragglet/ipxbox
RUN go build github.com/fragglet/ipxbox 

FROM ubuntu:22.04
RUN apt-get update 
RUN apt install --yes libpcap-dev
WORKDIR /app
COPY --from=builder /app/ipxbox /app/ipxbox
CMD ./ipxbox --port 10000