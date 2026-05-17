#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
config_dir="$HOME/.config"

mkdir -p "$config_dir/hypr/scripts"
mkdir -p "$config_dir/wofi/themes"

ln -sf "$repo_dir/hypr/hyprland.conf" "$config_dir/hypr/hyprland.conf"
ln -sf "$repo_dir/hypr/scripts/theme-switcher" "$config_dir/hypr/scripts/theme-switcher"
ln -sf "$repo_dir/wofi/style.css" "$config_dir/wofi/style.css"
ln -sf "$repo_dir/wofi/themes/dark.css" "$config_dir/wofi/themes/dark.css"
ln -sf "$repo_dir/wofi/themes/current.css" "$config_dir/wofi/themes/current.css"
ln -sf "$repo_dir/wofi/themes/light.css" "$config_dir/wofi/themes/light.css"

chmod +x "$config_dir/hypr/scripts/theme-switcher"
chmod +x "$repo_dir/link.sh"

printf 'Symlinked dotfiles from %s to %s\n' "$repo_dir" "$config_dir"
