#!/usr/bin/env sh

bar="$1"
config_dir="$HOME/.config/waybar"

if [ -z "$HYPRLAND_INSTANCE_SIGNATURE" ]; then
  echo "waybar: HYPRLAND_INSTANCE_SIGNATURE is unset — not a Hyprland session" >&2
  exit 1
fi

if [ ! -f "$config_dir/bars/$bar.json" ]; then
  echo "waybar: unknown bar '$bar'" >&2
  exit 1
fi

mkdir -p "$config_dir/runtime"
jq -s 'add' "$config_dir/modules.json" "$config_dir/bars/$bar.json" > "$config_dir/runtime/$bar.json"
