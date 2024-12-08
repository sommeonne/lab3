FROM gcc:latest

RUN apt-get update && apt-get install -y libmicrohttpd-dev

COPY . /app
WORKDIR /app

RUN g++ -o http_server server.cpp calc.cpp -lmicrohttpd -std=c++11

EXPOSE 8080

CMD ["./http_server"]

