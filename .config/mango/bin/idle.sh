#!/usr/bin/env bash
# ~/.config/mango/idle.sh
# Idle management via swayidle. Staged: lock at 5min, screen off at 10min,
# lock before sleep. -w makes swayidle wait for the locker before releasing
# the inhibitor (avoids a race where the screen sleeps before it locks).
#
# DPMS: Mango has no 'dpms' command. Use disable_monitor/enable_monitor by
# output name. eDP-1 is the G15 internal panel. If you dock an external
# monitor and want it to sleep too, add more -d disable_monitor lines.
set -euo pipefail

LOCK="swaylock -f" # -f = daemonize after locking
PANEL="eDP-1"

exec swayidle -w \
  timeout 450 "$LOCK" \
  timeout 660 "mmsg dispatch disable_monitor,$PANEL" \
  timeout 900 "systemctl suspend" \
  resume "mmsg dispatch enable_monitor,$PANEL" \
  before-sleep "$LOCK"
