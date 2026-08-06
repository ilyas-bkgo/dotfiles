#!/usr/bin/env bash
set -euo pipefail

# Ensure the Wayland runtime environment is available
export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/run/user/$(id -u)}"

if [ -z "${WAYLAND_DISPLAY:-}" ]; then
    for sock in "$XDG_RUNTIME_DIR"/wayland-*.sock; do
        [ -e "$sock" ] || continue
        WAYLAND_DISPLAY="${sock##*/}"
        WAYLAND_DISPLAY="${WAYLAND_DISPLAY%.sock}"
        break
    done
fi

export WAYLAND_DISPLAY="${WAYLAND_DISPLAY:-wayland-0}"
export PATH="$HOME/.local/bin:$PATH"

# Trigger walt random. 
# If swww shows a "cached" wallpaper first, it might be that swww-daemon 
# is restoring the last wallpaper before walt commands the new one.
# Walt itself manages the wallpaper selection and tells swww to apply it.
/home/urahara/.local/bin/walt random
