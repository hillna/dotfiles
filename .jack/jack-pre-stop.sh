#!/bin/bash

# Unload Pulse Audio JACK modules
for i in $(pactl list modules | grep -B 1 "Name: module-jack" |grep Module | sed 's/[^0-9]//g'); do
  pactl unload-module $i
done

