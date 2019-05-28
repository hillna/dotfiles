#!/bin/bash

autoclose=(claudia ladishd)
for proc in ${autoclose[@]}; do
  if pgrep $proc; then
    pkill $proc
    sleep 1s
  fi
done

pacmd suspend false

pacmd set-default-sink 0
pacmd set-default-source 0
