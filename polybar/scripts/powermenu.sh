#!/bin/bash

# Options
shutdown="Shutdown"
reboot="Reboot"
logout="Logout"

# Variable passed to rofi
options="$shutdown\n$reboot\n$logout"

chosen="$(echo -e "$options" | rofi -dmenu -i -p "Power Menu")"
case $chosen in
    $shutdown)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $logout)
        if [[ $DESKTOP_SESSION == "gnome" ]]; then
            gnome-session-quit --logout --no-prompt
        elif [[ $DESKTOP_SESSION == "xfce" ]]; then
            xfce4-session-logout --logout
        fi
        ;;
esac
