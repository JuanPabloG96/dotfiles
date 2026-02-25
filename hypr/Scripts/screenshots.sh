
#!/bin/bash

# Carpeta destino
DIR="$HOME/Pictures/Screenshots"

# Crear carpeta si no existe
mkdir -p "$DIR"

# Nombre con fecha
FILENAME="screenshot_$(date +'%Y-%m-%d_%H-%M-%S').png"

# Ruta completa
FILEPATH="$DIR/$FILENAME"

# Seleccionar región y capturar
grim -g "$(slurp)" "$FILEPATH"

# Si se tomó correctamente, copiar al portapapeles
if [ $? -eq 0 ]; then
    wl-copy < "$FILEPATH"
    notify-send "📸 Screenshot" "Guardado y copiado:\n$FILENAME"
else
    notify-send "❌ Screenshot" "Cancelado"
fi
