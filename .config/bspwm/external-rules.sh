#!/bin/sh

wid=$1
class=$2
instance=$3

if [ "$class" = Chromium ]; then
  title=$(xtitle "$wid")
  case "$title" in
    Authy)
      echo "state = floating"
      ;;
  esac
fi
