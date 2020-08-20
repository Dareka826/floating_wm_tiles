#!/bin/sh

NEXT_WIN_ID=$(wmctrl -l | awk "/$rx/"'{print $1}' | grep -i -A 1 "$(xdo id)" | tail -1)
[ "$NEXT_WIN_ID" = "$(xdo id)" ] && NEXT_WIN_ID=$(wmctrl -l | awk "/$rx/"'{print $1}' | head -1)

wmctrl -i -a $NEXT_WIN_ID
