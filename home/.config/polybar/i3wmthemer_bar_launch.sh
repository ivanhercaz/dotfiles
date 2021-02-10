#!/bin/env sh

pkill polybar

sleep 1;

# Launch
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
for m in $(polybar --list-monitors | cut -d":" -f1); do
	MONITOR=$m polybar --reload i3wmthemer_bar >> /tmp/polybar1.log & 
done
# polybar example >> /tmp/polybar1.log 2>&1 & disown
# polybar bar2 >> /tmp/polybar2.log 2>&1 & disown

echo "Bars launched..."
