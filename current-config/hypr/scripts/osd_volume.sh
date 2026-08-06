#!/bin/bash
volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2 * 100)}')
notify-send -h string:x-canonical-private-synchronous:osd_volume -h int:value:$volume -h string:x-dunst-stack-tag:volume -t 1500 -a osd-hud -i audio-volume-high "Volume: $volume%"
