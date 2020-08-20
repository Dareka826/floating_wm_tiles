#!/bin/sh

WIDS="$(wmctrl -l | awk "/$rx/"'{print $1}' | tr "\n" " ")"
for WID in $WIDS; do
	wmctrl -r $WID -b remove,hidden
done
