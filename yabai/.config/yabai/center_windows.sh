#!/bin/sh

WINDOW_WIDTHS="$(yabai -m query --windows --space | jq '.[].frame.w')"
DISPLAY_WIDTH="$(yabai -m query --displays --display | jq '.frame.w')"
COUNT="$(echo "$WINDOW_WIDTHS" | wc -l | tr -s " ")"
echo "width: $WINDOW_WIDTHS"
if [ "$COUNT" -le "$((DISPLAY_WIDTH / OPTIMAL_WIDTH))" ]; then
	PADDING=$(((DISPLAY_WIDTH - COUNT * OPTIMAL_WIDTH) / 3))
	echo "padding $PADDING"
	yabai -m space --padding abs:10:10:$PADDING:$PADDING
else
	yabai -m space --padding abs:10:10:10:10
fi
