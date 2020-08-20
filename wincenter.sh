#!/bin/bash

SCREEN_WIDTH=$(grep "SCREEN_WIDTH=" ~/.config/sxhkd/winvars | rev | cut -d'=' -f1 | rev)
SCREEN_HEIGHT=$(grep "SCREEN_HEIGHT=" ~/.config/sxhkd/winvars | rev | cut -d'=' -f1 | rev)
POLYBAR_Y=$(grep "POLYBAR_Y=" ~/.config/sxhkd/winvars | rev | cut -d'=' -f1 | rev)
BORDER_OFFSET_X=$(grep "BORDER_OFFSET_X=" ~/.config/sxhkd/winvars | rev | cut -d'=' -f1 | rev)
BORDER_OFFSET_Y=$(grep "BORDER_OFFSET_Y=" ~/.config/sxhkd/winvars | rev | cut -d'=' -f1 | rev)

SIZE=$(xwininfo -id $(xdo id) | grep -E "([W]idth|[H]eight)" | rev | cut -d' ' -f1 | rev | tr "\n" " ")

CVS_W=$(echo $SIZE | cut -d' ' -f1)
CVS_H=$(echo $SIZE | cut -d' ' -f2)

W=$(( $CVS_W + $BORDER_OFFSET_X ))
H=$(( $CVS_H + $BORDER_OFFSET_Y ))

X=$(( $SCREEN_WIDTH/2 - $W/2 ))
Y=$(( ($SCREEN_HEIGHT - $POLYBAR_Y)/2 + $POLYBAR_Y - $H/2 ))

xdo move -x $X -y $Y
