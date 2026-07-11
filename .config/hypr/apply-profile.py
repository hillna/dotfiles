#!/usr/bin/env python3
"""Apply an nwg-displays profile by name (desktop or laptop)."""

import json
import os
import sys

from nwg_displays.settings_applier import SettingsApplier
from nwg_displays.tools import get_config_dir, hyprctl

HYPR_DIR = os.path.expanduser("~/.config/hypr")
MONITORS_PATH = os.path.join(HYPR_DIR, "monitors.conf")


def find_profile(name):
    for path in (
        os.path.join(get_config_dir(), "profiles", f"{name}.json"),
        os.path.join(HYPR_DIR, "profiles", f"{name}.json"),
    ):
        if os.path.isfile(path):
            return path
    return None


def wake_displays(profile_data):
    """Re-enable DPMS after profile reload; nwg-displays can leave outputs off."""
    hyprctl("dispatch dpms on")
    for display in profile_data.get("displays", []):
        if display.get("active"):
            hyprctl(f"dispatch dpms on {display['name']}")


def main():
    if len(sys.argv) != 2:
        print("usage: apply-profile.py <desktop|laptop>", file=sys.stderr)
        sys.exit(2)

    name = sys.argv[1]
    profile_path = find_profile(name)
    if not profile_path:
        sys.exit(1)

    with open(profile_path, encoding="utf-8") as handle:
        profile_data = json.load(handle)

    print(f"[apply-profile] loading '{name}' from {profile_path}")
    SettingsApplier.apply_from_json(
        profile_data, MONITORS_PATH, get_config_dir(), name
    )
    wake_displays(profile_data)


if __name__ == "__main__":
    main()
