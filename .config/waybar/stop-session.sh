#!/usr/bin/env sh

for bar in left main right xps13; do
  systemctl --user stop "waybar@${bar}.service" 2>/dev/null || true
done
