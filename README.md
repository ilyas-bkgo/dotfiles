# Dotfiles

A minimal, dark Catppuccin-themed Hyprland setup — Hyprland (Lua config), Waybar, Hyprlock, Hypridle, and Hyprpaper.

<div align="center">
  <img src="assets/preview.webp" alt="Hyprland Desktop Preview" width="100%" style="border-radius: 8px;" />
</div>

## Included

- **Hyprland** — window manager config written in Lua (`hyprland.lua`), lock screen (`hyprlock.conf`), idle behavior (`hypridle.conf`), wallpaper daemon (`hyprpaper.conf`), plus helper scripts (`scripts/`)
- **Waybar** — status bar config and styling, with a custom Wi-Fi menu script

## Prerequisites

- [Hyprland](https://hyprland.org) (with Lua config support — see the [Hyprland Lua wiki page](https://wiki.hypr.land/Configuring/Start/))
- [Waybar](https://github.com/Alexays/Waybar)
- [hyprlock](https://github.com/hyprwm/hyprlock), [hypridle](https://github.com/hyprwm/hypridle), [hyprpaper](https://github.com/hyprwm/hyprpaper)
- A [Nerd Font](https://www.nerdfonts.com/) for icons in Waybar
- `grim`, `slurp`, `wl-copy` for screenshot keybinds
- `playerctl`, `brightnessctl`, `wpctl` for media/brightness/volume keybinds

## Usage

1. Clone the repo:
   ```bash
   git clone https://github.com/ilyas-bkgo/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   ```

2. Run the install script:
   ```bash
   ./link.sh
   ```

   This symlinks everything in `current-config/` into `~/.config/`. If you already have existing configs, they'll be backed up automatically to `~/.config-backup-<timestamp>/` instead of being overwritten.

3. Restart Hyprland (or reload configs) for changes to take effect.

## Notes

- Configs are symlinked, not copied — edit files inside `~/dotfiles/current-config/` and changes apply immediately.
- `SUPER + W` launches a personal tool (`walt`) that isn't included in this repo. Remove or replace that keybind in `hyprland.lua` if you don't have it.
- This repo reflects my current setup and will evolve over time. Use at your own risk, review before running on a machine with configs you care about.

## License

MIT
