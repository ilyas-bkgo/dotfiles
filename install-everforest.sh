#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
source_dir="$repo_dir/current-config/everforest"
backup_dir="$HOME/.config/dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

if [[ ! -d "$source_dir/hypr" || ! -d "$source_dir/waybar" ]]; then
    printf 'Everforest config files are missing from %s\n' "$source_dir" >&2
    exit 1
fi

copy_tree() {
    local name="$1"
    local source="$source_dir/$name"
    local destination="$HOME/.config/$name"
    local file relative

    mkdir -p "$destination"
    while IFS= read -r -d '' file; do
        relative="${file#"$source"/}"
        if [[ -e "$destination/$relative" ]]; then
            mkdir -p "$backup_dir/$name/$(dirname -- "$relative")"
            cp -a "$destination/$relative" "$backup_dir/$name/$relative"
        fi
    done < <(find "$source" -type f -print0)

    cp -a "$source/." "$destination/"
}

copy_tree hypr
copy_tree waybar

printf 'Everforest Hyprland and Waybar configs installed.\n'
if [[ -d "$backup_dir" ]]; then
    printf 'Previous files backed up to: %s\n' "$backup_dir"
fi
printf 'Reload Hyprland or log out and back in to apply the changes.\n'
