# Dotfiles

Linux desktop configuration files for Hyprland, Sway, and Waybar. The repository includes an easy-to-install **Everforest Hyprland + Waybar** profile, alongside the original configurations.

![Desktop preview](assets/preview.webp)

## Install Everforest

Clone the repository and run the installer:

```bash
git clone https://github.com/ilyas-bkgo/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install-everforest.sh
```

The installer backs up files it replaces under `~/.config/dotfiles-backup/`, then installs Hyprland, Hyprlock, Hypridle, Hyprpaper, and Waybar configs. It does not install packages. See [`current-config/everforest/README.md`](current-config/everforest/README.md) for requirements, keybindings, and customization notes.

## Other configurations

- `current-config/sway/` — Sway config
- `current-config/hypr/` — previous Hyprland config and related scripts
- `current-config/waybar/` — previous Waybar config and related assets
- `current-config/everforest/` — portable Everforest Hyprland and Waybar profile

Review configs before installing them. The older Sway and Waybar configurations may include machine-specific paths and dependencies.

## License

MIT
