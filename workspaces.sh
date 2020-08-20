#!/bin/sh

SEL_BG="#6600FF"
SEL_FG="#FFFFFF"
POP_BG="#222222"
POP_FG="#FFFFFF"

ALL_WS=$(wmctrl -d | cut -d' ' -f-2 | tr "\n" " ")
CUR_WS=$(wmctrl -d | grep \* | cut -d' ' -f -2 | sed 's/ //g')
POPULATED_WS=$(wmctrl -l | grep -v polybar | cut -d' ' -f3-3 | uniq | tr "\n" " ")

for ws in $ALL_WS; do
	EMPTY=y
	SELECTED=n
	[ $ws = $CUR_WS ] && SELECTED=y
	for pws in $POPULATED_WS; do
		[ $pws = $ws ] && EMPTY=n
	done

	ws=$(( $ws + 1 ))
	if [ $SELECTED = "n" ]; then
		if [ $EMPTY = "n" ]; then
			#printf "[ $ws ]"
			printf "%%{B$POP_BG}%%{F$POP_FG} $ws "
		fi
	else
		#printf "[=$ws=]"
		printf "%%{B$SEL_BG}%%{F$SEL_FG} $ws "
	fi
done
