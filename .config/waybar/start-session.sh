#!/usr/bin/env sh

if [ -z "$HYPRLAND_INSTANCE_SIGNATURE" ]; then
  echo "waybar: HYPRLAND_INSTANCE_SIGNATURE is unset — not a Hyprland session" >&2
  exit 1
fi

if [ -e /etc/xps13 ]; then
  bars="xps13"
elif [ -e /tmp/laptop_mode ]; then
  bars="left"
else
  bars="left main right"
fi

for bar in $bars; do
  systemctl --user start "waybar@${bar}.service"
done
