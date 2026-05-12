#!/bin/bash

option=$1

if [ "$option" == "add" ]; then

playlist=$(mpc --host 127.0.0.1 listall -f "%file%:%artist%:%title%")

[ -z "$playlist" ] && exit

choice=$(echo "$playlist" |
    awk -F: '{printf "%s - %s\n", $2, $3}' |
    rofi -dmenu -i -p "Search library:" -theme-str 'entry { placeholder: "Artist - Title"; }')

[ -z "$choice" ] && exit

selected_file=$(echo "$playlist" |
    awk -F: -v choice="$choice" '$2 " - " $3 == choice {print $1}' |
    head -n 1)

[ -z "$selected_file" ] && exit

mpc --host 127.0.0.1 add "$selected_file"

else

playlist=$(mpc --host 127.0.0.1 playlist -f "%position%:%artist%:%title%")

[ -z "$playlist" ] && exit

choice=$(echo "$playlist" |
    awk -F: '{printf "[%d] %s - %s\n", $1, $2, $3}' |
    rofi -dmenu -i -p "Search playlist:" -theme-str 'entry { placeholder: "Artist - Title or #"; }')

[ -z "$choice" ] && exit

pos=$(echo "$choice" | grep -o '^\[[0-9]*\]' | tr -d '[]')

[ -z "$pos" ] && exit

mpc --host 127.0.0.1 play "$pos"

fi
