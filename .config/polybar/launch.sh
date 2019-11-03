#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# set margain
bspc config top_padding 22

# Launch bars
if [ -f /etc/xps13 ]
then
    polybar main-xps13 &
else
    polybar main &
    polybar left &
    polybar right &
fi

echo "Bars launched..."

