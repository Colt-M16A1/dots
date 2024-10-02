#!/usr/bin/env bash

op=$( echo -e " Poweroff\n Reboot\n Suspend\n Lock\n Logout" | rofi -dmenu | awk '{print tolower($2)}' )

case $op in 
        poweroff)
								loginctl $op
								;;
        reboot)
								loginctl $op
								;;
        suspend)
                loginctl $op
                ;;
        lock)
		hyprlock
                ;;
        logout)
                hyprctl dispatch exit
                ;;
esac
