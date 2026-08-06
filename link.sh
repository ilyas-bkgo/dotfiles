#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
src_dir="$repo_dir/current-config"
config_dir="$HOME/.config"
backup_dir="$HOME/.config-backup-$(date +%Y%m%d-%H%M%S)"

link_file() {
  local src="$1"
  local dest="$2"

  mkdir -p "$(dirname "$dest")"

  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    mkdir -p "$(dirname "$backup_dir/${dest#$HOME/}")"
    mv "$dest" "$backup_dir/${dest#$HOME/}"
    printf 'Backed up existing %s\n' "$dest"
  fi

  ln -sf "$src" "$dest"
  printf 'Linked %s -> %s\n' "$dest" "$src"
}

link_dir() {
  local src="$1"
  local dest="$2"

  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    mkdir -p "$(dirname "$backup_dir/${dest#$HOME/}")"
    mv "$dest" "$backup_dir/${dest#$HOME/}"
    printf 'Backed up existing %s\n' "$dest"
  fi

  mkdir -p "$(dirname "$dest")"
  ln -sfn "$src" "$dest"
  printf 'Linked %s -> %s\n' "$dest" "$src"
}

# hypr
link_file "$src_dir/hypr/hyprland.lua"   "$config_dir/hypr/hyprland.lua"
link_file "$src_dir/hypr/hyprlock.conf"  "$config_dir/hypr/hyprlock.conf"
link_file "$src_dir/hypr/hypridle.conf"  "$config_dir/hypr/hypridle.conf"
link_file "$src_dir/hypr/hyprpaper.conf" "$config_dir/hypr/hyprpaper.conf"
link_dir  "$src_dir/hypr/scripts"        "$config_dir/hypr/scripts"

find "$config_dir/hypr/scripts" -type f -name '*.sh' -exec chmod +x {} \;

# sway
link_file "$src_dir/sway/config" "$config_dir/sway/config"

# waybar
link_file "$src_dir/waybar/config.jsonc"         "$config_dir/waybar/config.jsonc"
link_file "$src_dir/waybar/style.css"            "$config_dir/waybar/style.css"
link_file "$src_dir/waybar/V3border2.png"        "$config_dir/waybar/V3border2.png"
link_file "$src_dir/waybar/scripts/wifi-menu.sh" "$config_dir/waybar/scripts/wifi-menu.sh"
chmod +x "$config_dir/waybar/scripts/wifi-menu.sh"

if [ -d "$backup_dir" ]; then
  printf '\nExisting configs backed up to: %s\n' "$backup_dir"
fi

printf '\nDone. Symlinked current-config from %s to %s\n' "$src_dir" "$config_dir"
