#!/bin/sh
# Laptop / single-monitor mode: landscape AORUS on DisplayPort-1 only.
xrandr \
  --output DisplayPort-0 --off \
  --output DisplayPort-1 --primary --mode 2560x1440 --pos 0x0 --rate 165 --rotate normal \
  --output DisplayPort-2 --off \
  --output DisplayPort-3 --off \
  --output DisplayPort-4 --off \
  --output HDMI-A-0 --off \
  --output HDMI-A-1-1 --off
