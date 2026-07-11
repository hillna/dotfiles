#!/usr/bin/env sh
# Apply desktop or laptop Hyprland layout (monitors + workspaces).
#
# Preferred: nwg-displays profiles named "desktop" and "laptop" saved via the GUI
#   (~/.config/nwg-displays/profiles/*.json, or ~/.config/hypr/profiles/*.json).
# Fallback: copies monitors-{layout}.conf and workspaces-{layout}.conf.

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

if "$hypr_dir/apply-profile.py" "$layout"; then
  exit 0
fi

echo "apply-layout: no nwg-displays profile for '$layout', using hyprctl fallback"
cp "$hypr_dir/monitors-$layout.conf" "$hypr_dir/monitors.conf"
hyprctl reload
hyprctl dispatch dpms on
