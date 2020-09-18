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

if [ "$instance" = Godot_Engine ]; then
  sleep 0.15s
  title=$(xtitle "$wid")
  case "$title" in
    Godot)
      echo "state = tiled"
      ;;
    *)
      echo "state = floating"
      ;;
  esac
fi

# Uncomment below to test
# echo -ne "id $wid\nclass $class\ninst $instance\ntitle $title\n" >> /tmp/extout.txt
