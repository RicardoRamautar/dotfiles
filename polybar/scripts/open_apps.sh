#!/bin/bash

declare -A icons
icons["Firefox"]="󰆍"  # Example icon for Firefox
icons["Terminal"]="󰞷"  # Example icon for Terminal
icons["Code"]="󰇦"  # Example icon for Visual Studio Code

# Get list of open windows using wmctrl
windows=$(wmctrl -l | cut -d " " -f 5-)

# Initialize an empty string for the output
output=""

# Loop through each window title and assign an icon
for win in $windows; do
    found_icon=""
    for app in "${!icons[@]}"; do
        if [[ "$win" == *"$app"* ]]; then
            found_icon="${icons[$app]}"
            break
        fi
    done
    # Append the found icon to the output string
    if [[ -n "$found_icon" ]]; then
        output+="$found_icon "
    fi
done

# Print the output
echo $output
