#!/usr/bin/env bash
# ~/.config/mango/bin/idle.sh
# swayidle's -w flag fails against systemd 261 (BlockInhibited parse error),
# so before-sleep fires without waiting. Small race where the screen could
# sleep before the lock renders; acceptable given this machine autologins.
LOCK="swaylock -f"
PANEL="eDP-1"
exec swayidle \
  timeout 450 "$LOCK" \
  timeout 660 "mmsg dispatch disable_monitor,$PANEL" \
  resume "mmsg dispatch enable_monitor,$PANEL" \
  timeout 900 "systemctl suspend" \
  before-sleep "$LOCK"
