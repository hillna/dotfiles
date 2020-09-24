#!/bin/bash

# Unload Pulse Audio JACK modules
for module in $(pactl list modules | grep -B 1 "Name: module-jack" |grep Module | sed 's/[^0-9]//g'); do
  pactl unload-module $module
done

# Stop additional ALSA interfaces
for proc in $(pgrep alsa_); do
  kill $proc
done

