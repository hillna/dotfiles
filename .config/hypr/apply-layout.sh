#!/usr/bin/env sh
# Apply desktop or laptop Hyprland layout (monitors + workspaces).
#
# Requires nwg-displays profiles named "desktop" and "laptop"
# (~/.config/nwg-displays/profiles/*.json).

set -e

layout="$1"
hypr_dir="$HOME/.config/hypr"

if [ -z "$HYPRLAND_INSTANCE_SIGNATURE" ]; then
  echo "apply-layout: not a Hyprland session" >&2
  exit 1
fi

case "$layout" in
  desktop|laptop) ;;
  *)
    echo "usage: apply-layout.sh desktop|laptop" >&2
    exit 2
    ;;
esac

cp "$hypr_dir/workspaces-$layout.conf" "$hypr_dir/workspaces.conf"
"$hypr_dir/apply-profile.py" "$layout"
