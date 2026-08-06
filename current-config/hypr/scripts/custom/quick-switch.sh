#!/usr/bin/env bash
# Quick wallpaper switcher delegated to Walt, the single hyprpaper backend.
set -euo pipefail

exec /home/urahara/.local/bin/walt random --same
