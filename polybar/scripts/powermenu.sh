# #!/bin/bash

# # Log file for error output
# log_file="/tmp/power_menu.log"

# # Options
# shutdown="  Shutdown"
# reboot="  Reboot"
# suspend="󰤄  suspend"
# logout="  Logout"

# # Variable passed to rofi
# options="$shutdown\n$reboot\n$suspend\n$logout"

# chosen="$(echo -e "$options" | rofi -dmenu -i -p "Power Menu")"
# case $chosen in
#     $shutdown)
#         systemctl poweroff
#         ;;
#     $reboot)
#         systemctl reboot
#         ;;
#     $suspend)
#         systemctl suspend
#         ;;
#     $logout)
#         gnome-session-quit
#         # if [[ $DESKTOP_SESSION == "gnome" ]]; then
#         #     gnome-session-quit --logout --no-prompt
#         # elif [[ $DESKTOP_SESSION == "xfce" ]]; then
#         #     xfce4-session-logout --logout
#         # fi
#         ;;
# esac


#!/bin/bash

# Log file for error output
log_file="/tmp/power_menu.log"

# Options
shutdown="  Shutdown"
reboot="  Reboot"
suspend="󰤄  suspend"
logout="  Logout"

# Variable passed to rofi
options="$shutdown\n$reboot\n$suspend\n$logout"

# Execute rofi menu and capture user's choice
chosen="$(echo -e "$options" | rofi -dmenu -i -p "Power Menu" 2>> $log_file)"
if [ -z "$chosen" ]; then
    exit 0  # User canceled, exit gracefully
fi

# Execute corresponding action based on user's choice
case $chosen in
    $shutdown)
        systemctl poweroff 2>> $log_file
        ;;
    $reboot)
        systemctl reboot 2>> $log_file
        ;;
    $suspend)
        systemctl suspend 2>> $log_file
        ;;
    $logout)
        gnome-session-quit --logout --no-prompt 2>> $log_file
        ;;
    *)
        echo "Invalid choice: $chosen" >> $log_file
        ;;
esac

# Check the log file for any errors after running the script.
