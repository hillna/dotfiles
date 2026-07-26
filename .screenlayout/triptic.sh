#!/bin/sh
# Desktop triple: MSI OLED center (DP-0), AORUS left (DP-1), AORUS portrait right (DP-2).
xrandr \
  --output DisplayPort-0 --primary --mode 2560x1440 --pos 2560x550 --rate 360 --rotate normal \
  --output DisplayPort-1 --mode 2560x1440 --pos 0x550 --rate 165 --rotate normal \
  --output DisplayPort-2 --mode 2560x1440 --pos 5120x0 --rate 165 --rotate right \
  --output DisplayPort-3 --off \
  --output DisplayPort-4 --off \
  --output HDMI-A-0 --off \
  --output HDMI-A-1-1 --off
