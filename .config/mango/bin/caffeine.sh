#!/usr/bin/env bash
# ~/.config/mango/bin/caffeine.sh
# Toggle "caffeine" (keep awake): kills/restarts swayidle. When off, the
# machine won't auto-lock or sleep.
#
# Note: sway-audio-idle-inhibit already auto-inhibits while audio plays, so you
# mainly need this for silent stuff (reading, slideshows).
set -euo pipefail

if pgrep -x swayidle >/dev/null; then
  pkill -x swayidle
  notify-send -h string:x-canonical-private-synchronous:caffeine \
    -i caffeine "Caffeine: ON" "Idle & lock disabled"
else
  ~/.config/mango/bin/idle.sh &
  notify-send -h string:x-canonical-private-synchronous:caffeine \
    -i sleep "Caffeine: OFF" "Idle & lock active"
fi

# refresh the waybar caffeine/idle indicator immediately (signal 9)
pkill -RTMIN+9 waybar 2>/dev/null || true
