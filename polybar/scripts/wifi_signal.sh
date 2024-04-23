# #!/bin/bash

# # Specify the network interface
# INTERFACE="wlp0s20f3"

# # Get the signal strength
# SIGNAL=$(iw dev $INTERFACE link | grep signal | awk '{print $2}')

# # Determine the icon based on signal strength
# if [ -z "$SIGNAL" ]; then
#     echo "󰖪"  # No signal or not connected
# elif [ "$SIGNAL" -lt -75 ]; then
#     echo "󰤟"  # Less than 25%
# elif [ "$SIGNAL" -lt -60 ]; then
#     echo "󰤢"  # Less than 50%
# elif [ "$SIGNAL" -lt -50 ]; then
#     echo "󰤥"  # Less than 75%
# elif [ "$SIGNAL" -ge -50 ]; then
#     echo "󰤨"  # Above 90%
# fi

#!/bin/bash

# Define your interface and initial colors
INTERFACE="wlp0s20f3"
bg_color="#3a644c"  # Default background color
fg_color="#0f1314"  # Default foreground color

# Get the signal strength
SIGNAL=$(iw dev $INTERFACE link | grep signal | awk '{print $2}')

# Based on the signal strength, change the colors and icon
if [ -z "$SIGNAL" ]; then
    ICON="󰖪"
    fg_color="#ff0000"  # Red color for disconnected status
elif [ "$SIGNAL" -lt -75 ]; then
    ICON="󰤟"
elif [ "$SIGNAL" -lt -60 ]; then
    ICON="󰤢"
elif [ "$SIGNAL" -lt -50 ]; then
    ICON="󰤥"
elif [ "$SIGNAL" -ge -50 ]; then
    ICON="󰤨"
fi

# Output the formatted string
echo "%{B$bg_color F$fg_color} $ICON %{B- F-}"
