#!/bin/bash
current=$(brightnessctl get)
max=$(brightnessctl max)
brightness=$((current * 100 / max))
notify-send -h string:x-canonical-private-synchronous:osd_brightness -h int:value:$brightness -h string:x-dunst-stack-tag:brightness -t 1500 -a osd-hud -i display-brightness-symbolic "Brightness: $brightness%"
