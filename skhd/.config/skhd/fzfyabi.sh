#!/bin/bash
yabai -m query --windows |
	jq -r '.[] | select(.title != "window-switcher") | "\(.app) | \(.title) | \(.id)"' |
	fzf --prompt="Select a window: " |
	awk -F "|" '{print $3}' |
	xargs -I {} yabai -m window --focus {}
