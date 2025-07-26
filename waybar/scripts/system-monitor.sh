#!/bin/bash

# Uso de la CPU
# Modifica esta línea para usar 'printf "%.1f %%"' para un decimal y el signo %
CPU_USAGE=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {printf "%.1f%%", usage}')

# Uso de la Memoria
MEM_INFO=$(free -h | awk '/Mem:/ {print $3 "/" $2}' | sed 's/Gi/GB/g')

# Temperatura de la CPU (requiere lm_sensors, ajusta el sensor si es necesario)
CPU_TEMP=$(sensors 2>/dev/null | grep 'Package id 0:' | awk '{print $4}' | sed 's/+//;s/°C//')

# Salida en formato JSON para Waybar
echo "{\"text\": \"CPU: ${CPU_USAGE} | Temp: ${CPU_TEMP}°C | Mem: ${MEM_INFO}\", \"tooltip\": \"Detalles del Sistema\"}"
