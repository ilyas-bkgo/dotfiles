#!/usr/bin/env bash
# Simple WiFi menu for Waybar clicks.
# Requires: nmcli and wofi/rofi/dmenu

set -euo pipefail

MENU_CMD() {
  if command -v wofi >/dev/null 2>&1; then
    echo "wofi --dmenu -p WiFi"
  elif command -v rofi >/dev/null 2>&1; then
    echo "rofi -dmenu -p WiFi"
  else
    echo "dmenu -p WiFi"
  fi
}

run_menu() {
  eval "$1"
}

MAIN_MENU=$(printf "%s\n" "Toggle Wi-Fi" "Connect to network" "Disconnect" "Network settings" "Cancel")
CHOICE=$(printf "%s" "$MAIN_MENU" | $(MENU_CMD))

case "$CHOICE" in
  "Toggle Wi-Fi")
    if nmcli radio wifi | grep -qi on; then
      nmcli radio wifi off
    else
      nmcli radio wifi on
    fi
    ;;

  "Connect to network")
    SSIDS=$(nmcli -t -f SSID device wifi list | awk -F: 'length($1)>0 && !seen[$1]++{print $1}')
    if [ -z "$SSIDS" ]; then
      notify-send "WiFi" "No networks found"
      exit 0
    fi
    SELECTED=$(printf "%s" "$SSIDS" | $(MENU_CMD))
    if [ -n "$SELECTED" ]; then
      # Try to connect (will ask for passphrase if needed)
      nmcli device wifi connect "$SELECTED"
    fi
    ;;

  "Disconnect")
    # Disconnect current wifi device
    IFACE=$(nmcli -t -f DEVICE,TYPE connection show --active | awk -F: '$2=="wifi"{print $1; exit}')
    if [ -n "$IFACE" ]; then
      nmcli device disconnect "$IFACE"
    else
      notify-send "WiFi" "No active wifi connection"
    fi
    ;;

  "Network settings")
    if command -v nm-connection-editor >/dev/null 2>&1; then
      nm-connection-editor &
    else
      notify-send "WiFi" "nm-connection-editor not found"
    fi
    ;;

  *)
    exit 0
    ;;
esac
