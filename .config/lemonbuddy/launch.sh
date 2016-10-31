#!/usr/bin/env sh

# Terminate already running bar instances
killall -q lemonbuddy

# Wait until the processes have been shut down
while pgrep -x lemonbuddy >/dev/null; do sleep 1; done

# set margain
bspc config top_padding 22

# Launch bars
lemonbuddy main &

echo "Bars launched..."

