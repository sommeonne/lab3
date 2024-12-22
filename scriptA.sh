#!/bin/bash

start_container() {
    local container_name=$1
    local cpu_core=$2
    echo "Starting $container_name on CPU core $cpu_core..."
    
    if sudo docker ps -a --format "{{.Names}}" | grep -q "^$container_name$"; then
        echo "Container $container_name exists. Removing..."
        sudo docker rm -f "$container_name"
    fi

    sudo docker run --name "$container_name" --cpuset-cpus="$cpu_core" --network bridge -d sommeonnee/http_server:latest
}

stop_container() {
    local container_name=$1
    echo "Stopping container $container_name..."
    sudo docker stop "$container_name"
    sudo docker rm "$container_name"
}

check_cpu_usage() {
    local container_name=$1
    local cpu_usage=$(sudo docker stats --no-stream --format "{{.Name}} {{.CPUPerc}}" | grep "$container_name" | awk '{print $2}' | sed 's/%//')
    echo "${cpu_usage:-0}" 
}

update_containers() {
    echo "Checking for updates for the image..."
    if sudo docker pull sommeonnee/http_server:latest | grep -q "Downloaded newer image"; then
        echo "New version found. Updating containers..."
        for container in srv1 srv2 srv3; do
            if sudo docker ps --format "{{.Names}}" | grep -q "^$container$"; then
                echo "Updating $container..."
                local new_container="${container}_temp"
                
                start_container "$new_container" "$(get_cpu_core "$container")"
                
                stop_container "$container"
                
                sudo docker rename "$new_container" "$container"
                echo "$container updated successfully."
            fi
        done
    else
        echo "No updates available for the image."
    fi
}

get_cpu_core() {
    case $1 in
        srv1) echo "0" ;;
        srv2) echo "1" ;;
        srv3) echo "2" ;;
        *) echo "0" ;; 
    esac
}

monitor_containers() {
    echo "Starting container management process..."
    local idle_threshold=1.0 
    local busy_threshold=30.0 

    while true; do
        if ! sudo docker ps --format "{{.Names}}" | grep -q "^srv1$"; then
            start_container "srv1" 0
        fi

        local cpu_srv1=$(check_cpu_usage "srv1")
        if (( $(echo "$cpu_srv1 > $busy_threshold" | bc -l) )); then
            echo "srv1 is under heavy load. Starting srv2..."
            if ! sudo docker ps --format "{{.Names}}" | grep -q "^srv2$"; then
                start_container "srv2" 1
            fi
        fi

        if sudo docker ps --format "{{.Names}}" | grep -q "^srv2$"; then
            local cpu_srv2=$(check_cpu_usage "srv2")
            if (( $(echo "$cpu_srv2 > $busy_threshold" | bc -l) )); then
                echo "srv2 is under heavy load. Starting srv3..."
                if ! sudo docker ps --format "{{.Names}}" | grep -q "^srv3$"; then
                    start_container "srv3" 2
                fi
            fi
        fi

        if sudo docker ps --format "{{.Names}}" | grep -q "^srv3$"; then
            local cpu_srv3=$(check_cpu_usage "srv3")
            if (( $(echo "$cpu_srv3 < $idle_threshold" | bc -l) )); then
                echo "srv3 is idle. Stopping it..."
                stop_container "srv3"
            fi
        fi

        if sudo docker ps --format "{{.Names}}" | grep -q "^srv2$"; then
            local cpu_srv2=$(check_cpu_usage "srv2")
            if (( $(echo "$cpu_srv2 < $idle_threshold" | bc -l) )) && ! sudo docker ps --format "{{.Names}}" | grep -q "^srv3$"; then
                echo "srv2 is idle. Stopping it..."
                stop_container "srv2"
            fi
        fi

        update_containers

        sleep 5 # Зменшено час очікування для тестування
    done
}

monitor_containers

