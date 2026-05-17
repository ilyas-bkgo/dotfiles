# Dotfiles repo for Hyprland / Wofi

This repository contains a minimal set of configuration files for Hyprland and Wofi.

## Included files

- `hypr/hyprland.conf`
- `hypr/scripts/theme-switcher`
- `wofi/style.css`
- `wofi/themes/dark.css`
- `wofi/themes/current.css`
- `wofi/themes/light.css`

## Usage

1. Clone or copy this repo to `~/dotfiles`.
2. Run `./link.sh` from the repo root.
3. Verify the symlinks in `~/.config/hypr` and `~/.config/wofi`.

## Safety notes

- Keep this repo private if it contains any personal paths or credentials.
- Do not add sensitive files from `~/.config` unless you want them tracked publicly.
