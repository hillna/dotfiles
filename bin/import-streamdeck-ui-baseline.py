#!/usr/bin/env python3
"""Convert streamdeck-ui baseline JSON into StreamController page files (Stream Deck XL 8x4)."""

from __future__ import annotations

import json
import os
import sys
from pathlib import Path

DECK_SERIAL = "A00NA318327UFR"
COLS = 8
ROWS = 4
DATA_DIR = Path(
    os.environ.get(
        "STREAMCONTROLLER_DATA",
        Path.home() / ".config" / "streamcontroller" / "data",
    )
)
RUNTIME_DATA = Path.home() / ".config" / "streamcontroller" / "data"


def index_to_coords(index: int) -> str:
    x = index % COLS
    y = index // COLS
    return f"{x}x{y}"


def hex_to_rgba255(value: str) -> list[int]:
    value = value.lstrip("#")
    if len(value) == 6:
        value += "FF"
    if len(value) != 8:
        return [255, 255, 255, 255]
    return [int(value[i : i + 2], 16) for i in (0, 2, 4, 6)]


def make_state(state_data: dict, data_dir: Path, page_paths: dict[int, Path]) -> dict:
    state: dict = {
        "actions": [],
        "image-control-action": 0,
        "label-control-actions": [0, 0, 0],
        "background-control-action": 0,
    }

    text = state_data.get("text") or ""
    if text:
        font_color = state_data.get("font_color") or "#FFFFFFFF"
        if not font_color.startswith("#"):
            font_color = f"#{font_color}"
        if len(font_color) == 7:
            font_color += "FF"
        state["labels"] = {
            "bottom": {
                "text": text,
                "color": hex_to_rgba255(font_color),
                "font_size": state_data.get("font_size") or None,
                "font_family": None,
            }
        }

    icon = state_data.get("icon")
    if icon:
        icon_path = Path(icon).expanduser()
        asset_target = data_dir / "assets" / icon_path.name
        if icon_path.is_file():
            asset_target.parent.mkdir(parents=True, exist_ok=True)
            if not asset_target.exists():
                asset_target.write_bytes(icon_path.read_bytes())
            state["media"] = {"path": str(asset_target), "size": 0.85}

    switch_page = state_data.get("switch_page")
    if switch_page not in (None, "", 0, "0"):
        target = page_paths.get(int(switch_page))
        if target is not None:
            state["actions"].append(
                {
                    "id": "com_core447_DeckPlugin::ChangePage",
                    "settings": {
                        "selected_page": str(target),
                        "deck_number": None,
                    },
                }
            )

    command = state_data.get("command")
    if command:
        state["actions"].append(
            {
                "id": "com_core447_OSPlugin::RunCommand",
                "settings": {"command": command},
            }
        )

    return state


def build_page(page_index: int, buttons: dict, data_dir: Path, page_paths: dict[int, Path]) -> dict:
    page = {"keys": {}}
    for button_index, button_data in buttons.items():
        states_src = button_data.get("states") or {"0": button_data}
        coords = index_to_coords(int(button_index))
        page["keys"][coords] = {"states": {}}
        for state_id, state_data in sorted(states_src.items(), key=lambda item: int(item[0])):
            page["keys"][coords]["states"][str(state_id)] = make_state(
                state_data, data_dir, page_paths
            )
    return page


def main() -> int:
    if len(sys.argv) != 2:
        print(f"usage: {sys.argv[0]} <streamdeck-ui-baseline.json>", file=sys.stderr)
        return 1

    baseline_path = Path(sys.argv[1])
    with baseline_path.open() as handle:
        export = json.load(handle)

    deck_state = export["state"][DECK_SERIAL]
    data_dir = DATA_DIR
    pages_dir = data_dir / "pages"
    settings_dir = data_dir / "settings"
    decks_dir = settings_dir / "decks"
    for directory in (pages_dir, settings_dir, decks_dir, data_dir / "assets"):
        directory.mkdir(parents=True, exist_ok=True)

    page_paths = {
        1: RUNTIME_DATA / "pages" / "Main.json",
        2: RUNTIME_DATA / "pages" / "Power.json",
    }

    page_names = sorted(deck_state["buttons"].keys(), key=int)
    page_files = [pages_dir / "Main.json", pages_dir / "Power.json"]
    for ui_page_name, page_file in zip(page_names, page_files):
        page = build_page(int(ui_page_name), deck_state["buttons"][ui_page_name], data_dir, page_paths)
        page_file.write_text(json.dumps(page, indent=4) + "\n")

    deck_settings = {
        "brightness": {"value": deck_state.get("brightness", 50)},
        "screensaver": {
            "enable": True,
            "time-delay": deck_state.get("display_timeout", 1800) // 60,
            "brightness": deck_state.get("brightness_dimmed", 24),
        },
    }
    (decks_dir / f"{DECK_SERIAL}.json").write_text(json.dumps(deck_settings, indent=4) + "\n")

    pages_settings = {
        "default-pages": {
            DECK_SERIAL: str(page_paths[1]),
        }
    }
    (settings_dir / "pages.json").write_text(json.dumps(pages_settings, indent=4) + "\n")
    (data_dir / ".skip-onboarding").touch()
    print(f"Wrote StreamController data to {data_dir}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
