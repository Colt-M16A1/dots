#!/usr/bin/env bash
#  ┏┓┏┓┳┓┏┓┳┓┏┓┏┳┓┏┓┳┓ ┏┓
#  ┗┓┃┃┃┃┃┓┃┃┣  ┃ ┣┫┃┃ ┗┓
#  ┗┛┗┛┛┗┗┛┻┛┗┛ ┻ ┛┗┻┗┛┗┛
#                        



if [[ $(playerctl -p mpd status 2>/dev/null) == "Playing" ]]; then
    status='▷  '
else
    status='  '
fi

song_info=$(playerctl -p mpd metadata --format "$status {{title}}   󰝚   {{artist}}")

echo "$song_info"
