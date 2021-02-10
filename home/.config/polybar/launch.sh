#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Launch
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
for m in $(polybar --list-monitors | cut -d":" -f1); do
	MONITOR=$m polybar --reload example >> /tmp/polybar1.log & disown
done
# polybar example >> /tmp/polybar1.log 2>&1 & disown
# polybar bar2 >> /tmp/polybar2.log 2>&1 & disown

echo "Bars launched..."
