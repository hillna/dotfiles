#!/bin/sh
xrandr \
  --output DisplayPort-0 --primary --mode 2560x1440 --pos 2560x550 --rate 165 --rotate normal \
  --output DisplayPort-1 --mode 2560x1440 --pos 0x550 --rate 165 --rotate normal \
  --output HDMI-A-0 --mode 2560x1440 --pos 5120x0 --rotate right \
  --output HDMI-A-1 --off

