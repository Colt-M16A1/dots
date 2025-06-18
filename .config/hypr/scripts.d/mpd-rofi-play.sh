#!/bin/bash

#china number #1
playlist=$(mpc --host 127.0.0.1 playlist -f "%position%:%artist%:%title%")

[ -z "$playlist" ] && exit

choice=$(echo "$playlist" | 
    awk -F: '{printf "[%d] %s - %s\n", $1, $2, $3}' | 
    rofi -dmenu -i -p "Search playlist:" -theme-str 'entry { placeholder: "Artist - Title or #"; }')

[ -z "$choice" ] && exit

pos=$(echo "$choice" | grep -o '^\[[0-9]*\]' | tr -d '[]')

[ -z "$pos" ] && exit

mpc --host 127.0.0.1 play "$pos"
