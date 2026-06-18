#!/usr/bin/env sh

if [ -z "$HYPRLAND_INSTANCE_SIGNATURE" ]; then
  echo "hyprpaper: HYPRLAND_INSTANCE_SIGNATURE is unset — not a Hyprland session" >&2
  exit 1
fi
