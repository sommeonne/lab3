#!/bin/bash

send_request() {
    response=$(curl -s http://localhost:8080/calculate)
    echo "Response received: $response"
}

while true; do
    sleep_time=$((5 + RANDOM % 6))  

    send_request &

    sleep $sleep_time
done

