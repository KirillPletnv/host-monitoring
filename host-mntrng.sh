#!/bin/bash

HOSTS_FILE="hosts.txt"
LOG_FILE="ping_log.txt"

while read -r host; do
    if [[ -n "$host" ]]; then
        START=$(date +%s%3N)
        ping -c 1 -W 1 "$host" &> /dev/null
        STATUS=$?
        END=$(date +%s%3N)
        TIME=$((END - START))

        if [[ $STATUS -eq 0 ]]; then
            echo "$(date '+%Y-%m-%d %H:%M:%S') - $host is UP (response time: ${TIME}ms)" | tee -a "$LOG_FILE"
        else
            echo "$(date '+%Y-%m-%d %H:%M:%S') - $host is DOWN" | tee -a "$LOG_FILE"
        fi
    fi
done < "$HOSTS_FILE"
