#!/bin/sh
xrandr \
  --output DisplayPort-0 --off \
  --output DisplayPort-1 --off \
  --output DisplayPort-2 --mode 2560x1440 --pos 0x0 --rate 165 --rotate normal \
  --output DisplayPort-3 --off \
  --output DisplayPort-4 --off \
  --output HDMI-A-0 --off \
  --output HDMI-A-1-1 --off
