#!/bin/bash
selected=$(cat /usr/share/dict/words | rofi -dmenu -p "Dictionary:" -matching prefix)

if [ ! -z "$selected" ]; then
    echo -n "$selected" | wl-copy
fi
