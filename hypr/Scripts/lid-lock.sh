#!/bin/bash
# Solo bloquea si está en batería y sin monitor externo conectado
on_battery=$(cat /sys/class/power_supply/AC*/online 2>/dev/null)
monitors=$(hyprctl monitors -j | jq 'length')

if [ "$on_battery" = "0" ] && [ "$monitors" -le 1 ]; then
    hyprlock
fi
