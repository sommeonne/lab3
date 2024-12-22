FROM gcc:latest AS builder

RUN apt-get update && apt-get install -y libmicrohttpd-dev git

WORKDIR /app
RUN git clone --branch branchHTTPserver https://github.com/sommeonne/lab3.git .

RUN g++ -o http_server server.cpp calc.cpp -lmicrohttpd -std=c++11

FROM alpine:latest

RUN apk add --no-cache libstdc++ libmicrohttpd

COPY --from=builder /app/http_server /usr/local/bin/http_server

EXPOSE 8080

CMD ["/usr/local/bin/http_server"]
