#!/bin/bash

POS=$(xwininfo -id $(xdo id) | grep "[u]pper-left" | rev | cut -d' ' -f1 | rev | tr "\n" " ")

A_X=$(echo $POS | cut -d' ' -f1) # Absolute X (x of window canvas)
A_Y=$(echo $POS | cut -d' ' -f2) # Absolute Y (y of window canvas)
R_X=$(echo $POS | cut -d' ' -f3) # Relative X (width of the left border)
R_Y=$(echo $POS | cut -d' ' -f4) # Relative Y (height of the top border)

X=$(( $A_X - $R_X ))
Y=$(( $A_Y - $R_Y ))

X=$(( $X + $1 ))
Y=$(( $Y + $2 ))

xdo move -x $X -y $Y
