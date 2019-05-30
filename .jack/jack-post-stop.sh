#!/bin/bash

#claudia_pid=$(pgrep -a python3 |grep claudia |awk '{print $1}')
#if [ $claudia_pid -gt 0 ]; then
#  kill $claudia_pid
#  sleep 1s
#fi
#
#if pgrep ladishd; then
#  pkill ladishd
#fi

pacmd suspend false

pacmd set-default-sink 0
pacmd set-default-source 0
