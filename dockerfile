# Stage 1: Build the executable
FROM alpine:latest AS builder

# Встановлюємо компілятор і бібліотеки
RUN apk add --no-cache \
    g++ \
    libmicrohttpd-dev \
    git \
    make

# Завантажуємо репозиторій
WORKDIR /app
RUN git clone --branch branchHTTPserver https://github.com/sommeonne/lab3.git .

# Компілюємо програму без -static
RUN g++ -o http_server server.cpp calc.cpp -lmicrohttpd -std=c++11

# Stage 2: Runtime образ
FROM alpine:latest

# Встановлюємо необхідні бібліотеки
RUN apk add --no-cache libmicrohttpd libstdc++

# Копіюємо скомпільований бінарний файл
COPY --from=builder /app/http_server /usr/local/bin/http_server

# Запускаємо сервер
EXPOSE 8080
CMD ["/usr/local/bin/http_server"]

