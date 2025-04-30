#!/usr/bin/env sh

# Terminate already running bar instances
pkill polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch bars
bspc config top_padding 22

if [ -e /etc/xps13 ]; then
  polybar -r main-xps13 &
  disown
else
  polybar -r left &
  disown
  if [ ! -e /tmp/laptop_mode ]; then
    polybar -r main &
    disown
    polybar -r right &
    disown
  fi
fi

echo "Bars launched..."
