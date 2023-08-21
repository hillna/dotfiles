#!/bin/sh
xrandr \
  --output DisplayPort-0 --off \
  --output DisplayPort-1 --mode 2560x1440 --pos 0x0 --rate 165 --rotate normal \
  --output HDMI-A-0 --off \
  --output HDMI-A-1 --off

