#!/usr/bin/env bash
# ~/.config/mango/waybar/indicators/ind-caffeine.sh
# Caffeine indicator. swayidle running -> idle active -> caffeine OFF (blank).
# swayidle absent -> caffeine ON -> show icon.
if pgrep -x swayidle >/dev/null; then
  echo '{"text": ""}'
else
  echo '{"text": " 󰅶 ", "tooltip": "Caffeine on — idle & lock disabled", "class": "active"}'
fi
