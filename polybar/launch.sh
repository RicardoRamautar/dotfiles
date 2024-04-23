#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location
# polybar example 2>&1 | tee -a /tmp/polybar.log & disown
# polybar left_bar 2>&1 | tee -a /tmp/polybar.log & disown
# polybar right_bar 2>&1 | tee -a /tmp/polybar.log & disown
# polybar center_bar 2>&1 | tee -a /tmp/polybar.log & disown
polybar bar1 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."
