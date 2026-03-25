#!/bin/bash

target_lang=${1:-tr}

text=$(rofi -dmenu -p "Translate ($target_lang):" -theme-str 'entry { placeholder: "Translate";}')

[[ -z "$text" ]] && exit 1

encoded_text=$(jq -rn --arg x "$text" '$x|@uri')

response=$(curl -s "https://translate.plausibility.cloud/api/v1/auto/$target_lang/$encoded_text")

translated_text=$(echo "$response" | jq -r '.translation')

echo "" | rofi -dmenu \
    -p "Translation ($target_lang):" \
    -mesg "$translated_text" \
    -theme-str 'listview {lines: 0;} entry { placeholder: "Translation";}'

echo "$translated_text" | wl-copy
