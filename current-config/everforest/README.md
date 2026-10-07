# Everforest Hyprland + Waybar

Everforest colors for Hyprland's Lua configuration and Waybar. The setup includes Hyprlock, Hypridle, and Hyprpaper starter configs. No wallpaper or personal scripts are required.

## Fast install

From the repository root, run:

```bash
./install-everforest.sh
```

The installer backs up any files it will replace to `~/.config/dotfiles-backup/<timestamp>/`, then copies the Everforest configs into `~/.config/hypr` and `~/.config/waybar`. Log out and back in, or reload Hyprland and restart Waybar.

To install without the script, copy the contents of `current-config/everforest/hypr/` to `~/.config/hypr/` and `current-config/everforest/waybar/` to `~/.config/waybar/`.

## Requirements

- Hyprland with the Lua configuration API available in your build
- Waybar built with Hyprland and WirePlumber module support
- `kitty`, `dolphin`, and `wofi` for the default app keybindings
- `hyprlock` and `hypridle` for locking and idle handling
- `wpctl` and `brightnessctl` for media and brightness keys
- A Nerd Font for workspace/network symbols (optional)

Install these packages with your distribution's package manager. The installer only copies configuration files.

## Defaults to customize

- The keyboard layout is `us`; change `kb_layout` in `hyprland.lua` for your layout.
- Change `terminal`, `fileManager`, and `menu` near the top of `hyprland.lua` if you use different apps.
- The monitor is left to Hyprland's automatic defaults, so no output name needs editing.
- The Waybar battery and temperature modules hide or report unavailable hardware as supported by your system.
- `Super+Return` opens the terminal, `Super+Space` opens the app menu, `Super+L` locks, and `Super+M` exits Hyprland.

Existing config files are backed up before replacement. To restore one, copy its backup from `~/.config/dotfiles-backup/` to its original location.
