#!/usr/bin/env bash
# Waybar weather script using wttr.in
# Set LOCATION to your city, or leave empty for IP-based auto-detect
LOCATION="Pawing, Palo, Leyte, Visayas, Philippines"

DATA=$(curl -sf --max-time 5 "wttr.in/${LOCATION}?format=j1" 2>/dev/null)

if [ -z "$DATA" ]; then
  echo '{"text": "", "class": "unavailable"}'
  exit 0
fi

TEMP=$(echo "$DATA" | jq -r '.current_condition[0].temp_C')
CODE=$(echo "$DATA" | jq -r '.current_condition[0].weatherCode')
DESC=$(echo "$DATA" | jq -r '.current_condition[0].weatherDesc[0].value')

case "$CODE" in
  113)           ICON="󰖙" ;;  # sunny/clear
  116)           ICON="󰖕" ;;  # partly cloudy
  119|122)       ICON="󰖐" ;;  # cloudy/overcast
  143|248|260)   ICON="󰖑" ;;  # fog/mist
  176|263|266|293|296|299|302|305|308|353|356|359) ICON="󰖗" ;;  # rain
  179|182|185|311|314|317|320|323|326|329|332|335|338|350|362|365|368|371|374|377) ICON="󰼴" ;; # snow
  200|386|389|392|395) ICON="󰖓" ;;  # thunderstorm
  *)             ICON="󰖐" ;;
esac

echo "{\"text\": \"${ICON} ${TEMP}°C\", \"tooltip\": \"${DESC}\", \"class\": \"\"}"
