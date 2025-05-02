#!/bin/bash

SERVICE="nginx"
LOGFILE="/var/log/${SERVICE}_monitor.log"
INTERVAL=30

while true; do
    if ! systemctl is-active --quiet "$SERVICE"; then
        echo "$(date '+%Y-%m-%d %H:%M:%S') ❌ $SERVICE is down" >> "$LOGFILE"
        # добавить уведомление (например, через телеграм-бота)
    else
        echo "$(date '+%Y-%m-%d %H:%M:%S') ✅ $SERVICE is running" >> "$LOGFILE"
    fi
    sleep "$INTERVAL"
done
