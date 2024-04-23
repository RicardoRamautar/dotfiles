# #!/bin/bash

# # Get brightness levels using xrandr and awk
# PRIMARY_BRIGHTNESS=$(xrandr --verbose | grep -i 'Brightness' | head -n 1 | awk '{print $2}')
# # SECONDARY_BRIGHTNESS=$(xrandr --verbose | grep -i 'Brightness' | tail -n 1 | awk '{print $2}')

# # Output the brightness levels. Adjust this line if you have more than one display.
# echo "$PRIMARY_BRIGHTNESS"

#!/bin/bash

bg_color="#242436"  # Default background color
fg_color="#9eb4a5"  # Default foreground color

# Get the current brightness for the primary display
BRIGHTNESS=$(xrandr --verbose | grep -i 'Brightness' | head -n 1 | awk '{print $2}')

# Convert the brightness level to a whole percentage
BRIGHTNESS_PERCENT=$(awk -v br="$BRIGHTNESS" 'BEGIN {printf "%.0f\n", br * 100}')

# Output the brightness level as a whole number percentage
# echo "$BRIGHTNESS_PERCENT%"
echo "%{B$bg_color F$fg_color} $BRIGHTNESS_PERCENT% %{B- F-}"
