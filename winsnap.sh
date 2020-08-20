#!/bin/sh

SCREEN_WIDTH=$(grep "SCREEN_WIDTH=" ~/.config/sxhkd/winvars | rev | cut -d'=' -f1 | rev)
SCREEN_HEIGHT=$(grep "SCREEN_HEIGHT=" ~/.config/sxhkd/winvars | rev | cut -d'=' -f1 | rev)
POLYBAR_Y=$(grep "POLYBAR_Y=" ~/.config/sxhkd/winvars | rev | cut -d'=' -f1 | rev)
BORDER_OFFSET_X=$(grep "BORDER_OFFSET_X=" ~/.config/sxhkd/winvars | rev | cut -d'=' -f1 | rev)
BORDER_OFFSET_Y=$(grep "BORDER_OFFSET_Y=" ~/.config/sxhkd/winvars | rev | cut -d'=' -f1 | rev)
GAPS=$(grep "GAPS=" ~/.config/sxhkd/winvars | rev | cut -d'=' -f1 | rev)

#####################
#     50% Snaps     #
#####################

# Snap left
# +--------+--------+
# |XXXXXXXX|        |
# |XXXXXXXX|        |
# |XXXXXXXX|        |
# |XXXXXXXX|        |
# |XXXXXXXX|        |
# +--------+--------+
if [ $1 = "left" ]; then
	xdotool getactivewindow \
		windowsize \
			$(( ($SCREEN_WIDTH - $GAPS*3)/2 - $BORDER_OFFSET_X )) \
			$(( $SCREEN_HEIGHT - $POLYBAR_Y - $GAPS*2 - $BORDER_OFFSET_Y )) \
		windowmove \
			$GAPS \
			$(( $GAPS + $POLYBAR_Y ))
	exit
fi

# Snap right
# +--------+--------+
# |        |XXXXXXXX|
# |        |XXXXXXXX|
# |        |XXXXXXXX|
# |        |XXXXXXXX|
# |        |XXXXXXXX|
# +--------+--------+
if [ $1 = "right" ]; then
	xdotool getactivewindow \
		windowsize \
			$(( ($SCREEN_WIDTH - $GAPS*3)/2 - $BORDER_OFFSET_X )) \
			$(( $SCREEN_HEIGHT - $POLYBAR_Y - $GAPS*2 - $BORDER_OFFSET_Y )) \
		windowmove \
			$(( $SCREEN_WIDTH / 2 + $GAPS / 2 )) \
			$(( $GAPS + $POLYBAR_Y ))
	exit
fi

# Snap up
# +-----------------+
# |XXXXXXXXXXXXXXXXX|
# |XXXXXXXXXXXXXXXXX|
# +-----------------+
# |                 |
# |                 |
# +-----------------+
if [ $1 = "up" ]; then
	xdotool getactivewindow \
		windowsize \
			$(( $SCREEN_WIDTH - $GAPS*2 - $BORDER_OFFSET_X )) \
			$(( ($SCREEN_HEIGHT-$POLYBAR_Y-$GAPS*3) / 2 - $BORDER_OFFSET_Y )) \
		windowmove \
			$GAPS \
			$(( $GAPS + $POLYBAR_Y ))
	exit
fi

# Snap down
# +-----------------+
# |                 |
# |                 |
# +-----------------+
# |XXXXXXXXXXXXXXXXX|
# |XXXXXXXXXXXXXXXXX|
# +-----------------+
if [ $1 = "down" ]; then
	xdotool getactivewindow \
		windowsize \
			$(( $SCREEN_WIDTH - $GAPS*2 - $BORDER_OFFSET_X )) \
			$(( ($SCREEN_HEIGHT-$POLYBAR_Y-$GAPS*3) / 2 - $BORDER_OFFSET_Y )) \
		windowmove \
			$GAPS \
			$(( ($SCREEN_HEIGHT-$POLYBAR_Y)/2 + $POLYBAR_Y + $GAPS/2 ))
	exit
fi

#####################
#     25% Snaps     #
#####################

# +--------+--------+
# |XXXXXXXX|        |
# |XXXXXXXX|        |
# +--------+--------+
# |        |        |
# |        |        |
# +--------+--------+
if [ $1 = "left-up" ]; then
	xdotool getactivewindow \
		windowsize \
			$(( ($SCREEN_WIDTH-$GAPS*3)/2 - $BORDER_OFFSET_X )) \
			$(( ($SCREEN_HEIGHT-$POLYBAR_Y-$GAPS*3)/2 - $BORDER_OFFSET_Y )) \
		windowmove \
			$GAPS \
			$(( $POLYBAR_Y + $GAPS ))
	exit
fi

# +--------+--------+
# |        |        |
# |        |        |
# +--------+--------+
# |XXXXXXXX|        |
# |XXXXXXXX|        |
# +--------+--------+
if [ $1 = "left-down" ]; then
	xdotool getactivewindow \
		windowsize \
			$(( ($SCREEN_WIDTH-$GAPS*3)/2 - $BORDER_OFFSET_X )) \
			$(( ($SCREEN_HEIGHT-$POLYBAR_Y-$GAPS*3)/2 - $BORDER_OFFSET_Y )) \
		windowmove \
			$GAPS \
			$(( ($SCREEN_HEIGHT-$POLYBAR_Y)/2 + $POLYBAR_Y + $GAPS/2 ))
	exit
fi

# +--------+--------+
# |        |XXXXXXXX|
# |        |XXXXXXXX|
# +--------+--------+
# |        |        |
# |        |        |
# +--------+--------+
if [ $1 = "right-up" ]; then
	xdotool getactivewindow \
		windowsize \
			$(( ($SCREEN_WIDTH-$GAPS*3)/2 - $BORDER_OFFSET_X )) \
			$(( ($SCREEN_HEIGHT-$POLYBAR_Y-$GAPS*3)/2 - $BORDER_OFFSET_Y )) \
		windowmove \
			$(( $SCREEN_WIDTH/2 + $GAPS/2 )) \
			$(( $POLYBAR_Y + $GAPS ))
	exit
fi

# +--------+--------+
# |        |        |
# |        |        |
# +--------+--------+
# |        |XXXXXXXX|
# |        |XXXXXXXX|
# +--------+--------+
if [ $1 = "right-down" ]; then
	xdotool getactivewindow \
		windowsize \
			$(( ($SCREEN_WIDTH-$GAPS*3)/2 - $BORDER_OFFSET_X )) \
			$(( ($SCREEN_HEIGHT-$POLYBAR_Y-$GAPS*3)/2 - $BORDER_OFFSET_Y )) \
		windowmove \
			$(( $SCREEN_WIDTH/2 + $GAPS/2 )) \
			$(( ($SCREEN_HEIGHT-$POLYBAR_Y)/2 + $POLYBAR_Y + $GAPS/2 ))
	exit
fi

########################
#     6 tile snaps     #
########################

# +-----+-----+-----+
# |XXXXX|     |     |
# |XXXXX|     |     |
# +-----+-----+-----+
# |     |     |     |
# |     |     |     |
# +-----+-----+-----+
if [ $1 = "6-up-left" ]; then
	xdotool getactivewindow \
		windowsize \
			$(( ($SCREEN_WIDTH-$GAPS*4)/3 - $BORDER_OFFSET_X )) \
			$(( ($SCREEN_HEIGHT-$POLYBAR_Y-$GAPS*3)/2 - $BORDER_OFFSET_Y )) \
		windowmove \
			$GAPS \
			$(( $POLYBAR_Y + $GAPS ))
	exit
fi

# +-----+-----+-----+
# |     |XXXXX|     |
# |     |XXXXX|     |
# +-----+-----+-----+
# |     |     |     |
# |     |     |     |
# +-----+-----+-----+
if [ $1 = "6-up-center" ]; then
	xdotool getactivewindow \
		windowsize \
			$(( ($SCREEN_WIDTH-$GAPS*4)/3 - $BORDER_OFFSET_X )) \
			$(( ($SCREEN_HEIGHT-$POLYBAR_Y-$GAPS*3)/2 - $BORDER_OFFSET_Y )) \
		windowmove \
			$(( $SCREEN_WIDTH/2 - ($SCREEN_WIDTH-$GAPS*4)/6 )) \
			$(( $POLYBAR_Y + $GAPS ))
	exit
fi

# +-----+-----+-----+
# |     |     |XXXXX|
# |     |     |XXXXX|
# +-----+-----+-----+
# |     |     |     |
# |     |     |     |
# +-----+-----+-----+
if [ $1 = "6-up-right" ]; then
	xdotool getactivewindow \
		windowsize \
			$(( ($SCREEN_WIDTH-$GAPS*4)/3 - $BORDER_OFFSET_X )) \
			$(( ($SCREEN_HEIGHT-$POLYBAR_Y-$GAPS*3)/2 - $BORDER_OFFSET_Y )) \
		windowmove \
			$(( $SCREEN_WIDTH/2 + ($SCREEN_WIDTH+$GAPS*2)/6 )) \
			$(( $POLYBAR_Y + $GAPS ))
	exit
fi

# +-----+-----+-----+
# |     |     |     |
# |     |     |     |
# +-----+-----+-----+
# |XXXXX|     |     |
# |XXXXX|     |     |
# +-----+-----+-----+
if [ $1 = "6-down-left" ]; then
	xdotool getactivewindow \
		windowsize \
			$(( ($SCREEN_WIDTH-$GAPS*4)/3 - $BORDER_OFFSET_X )) \
			$(( ($SCREEN_HEIGHT-$POLYBAR_Y-$GAPS*3)/2 - $BORDER_OFFSET_Y )) \
		windowmove \
			$GAPS \
			$(( ($SCREEN_HEIGHT-$POLYBAR_Y)/2 +	$POLYBAR_Y + $GAPS/2 ))
	exit
fi

# +-----+-----+-----+
# |     |     |     |
# |     |     |     |
# +-----+-----+-----+
# |     |XXXXX|     |
# |     |XXXXX|     |
# +-----+-----+-----+
if [ $1 = "6-down-center" ]; then
	xdotool getactivewindow \
		windowsize \
			$(( ($SCREEN_WIDTH-$GAPS*4)/3 - $BORDER_OFFSET_X )) \
			$(( ($SCREEN_HEIGHT-$POLYBAR_Y-$GAPS*3)/2 - $BORDER_OFFSET_Y )) \
		windowmove \
			$(( $SCREEN_WIDTH/2 - ($SCREEN_WIDTH-$GAPS*4)/6 )) \
			$(( ($SCREEN_HEIGHT-$POLYBAR_Y)/2 +	$POLYBAR_Y + $GAPS/2 ))
	exit
fi

# +-----+-----+-----+
# |     |     |     |
# |     |     |     |
# +-----+-----+-----+
# |     |     |XXXXX|
# |     |     |XXXXX|
# +-----+-----+-----+
if [ $1 = "6-down-right" ]; then
	xdotool getactivewindow \
		windowsize \
			$(( ($SCREEN_WIDTH-$GAPS*4)/3 - $BORDER_OFFSET_X )) \
			$(( ($SCREEN_HEIGHT-$POLYBAR_Y-$GAPS*3)/2 - $BORDER_OFFSET_Y )) \
		windowmove \
			$(( $SCREEN_WIDTH/2 + ($SCREEN_WIDTH+$GAPS*2)/6 )) \
			$(( ($SCREEN_HEIGHT-$POLYBAR_Y)/2 +	$POLYBAR_Y + $GAPS/2 ))
	exit
fi

#############################
#     Triple side snaps     #
#############################

# +--------+--------+
# |XXXXXXXX|        |
# +--------+--------+
# |        |        |
# +--------+--------+
# |        |        |
# +--------+--------+
if [ $1 = "6-left-up" ]; then
	xdotool getactivewindow \
		windowsize \
			$(( ($SCREEN_WIDTH-$GAPS*3)/2 - $BORDER_OFFSET_X )) \
			$(( ($SCREEN_HEIGHT-$POLYBAR_Y-$GAPS*4)/3 - $BORDER_OFFSET_Y )) \
		windowmove \
			$GAPS \
			$(( $POLYBAR_Y + $GAPS ))
	exit
fi

# +--------+--------+
# |        |        |
# +--------+--------+
# |XXXXXXXX|        |
# +--------+--------+
# |        |        |
# +--------+--------+
if [ $1 = "6-left-center" ]; then
	xdotool getactivewindow \
		windowsize \
			$(( ($SCREEN_WIDTH-$GAPS*3)/2 - $BORDER_OFFSET_X )) \
			$(( ($SCREEN_HEIGHT-$POLYBAR_Y-$GAPS*4)/3 - $BORDER_OFFSET_Y )) \
		windowmove \
			$GAPS \
			$(( ($SCREEN_HEIGHT-$POLYBAR_Y)/2 + $POLYBAR_Y - ($SCREEN_HEIGHT-$POLYBAR_Y-$GAPS*4)/6 ))
	exit
fi

# +--------+--------+
# |        |        |
# +--------+--------+
# |        |        |
# +--------+--------+
# |XXXXXXXX|        |
# +--------+--------+
if [ $1 = "6-left-down" ]; then
	xdotool getactivewindow \
		windowsize \
			$(( ($SCREEN_WIDTH-$GAPS*3)/2 - $BORDER_OFFSET_X )) \
			$(( ($SCREEN_HEIGHT-$POLYBAR_Y-$GAPS*4)/3 - $BORDER_OFFSET_Y )) \
		windowmove \
			$GAPS \
			$(( ($SCREEN_HEIGHT-$POLYBAR_Y)/2 + $POLYBAR_Y + ($SCREEN_HEIGHT-$POLYBAR_Y+$GAPS*2)/6 ))
	exit
fi

# +--------+--------+
# |        |XXXXXXXX|
# +--------+--------+
# |        |        |
# +--------+--------+
# |        |        |
# +--------+--------+
if [ $1 = "6-right-up" ]; then
	xdotool getactivewindow \
		windowsize \
			$(( ($SCREEN_WIDTH-$GAPS*3)/2 - $BORDER_OFFSET_X )) \
			$(( ($SCREEN_HEIGHT-$POLYBAR_Y-$GAPS*4)/3 - $BORDER_OFFSET_Y )) \
		windowmove \
			$(( $SCREEN_WIDTH/2 + $GAPS/2 )) \
			$(( $POLYBAR_Y + $GAPS ))
	exit
fi

# +--------+--------+
# |        |        |
# +--------+--------+
# |        |XXXXXXXX|
# +--------+--------+
# |        |        |
# +--------+--------+
if [ $1 = "6-right-center" ]; then
	xdotool getactivewindow \
		windowsize \
			$(( ($SCREEN_WIDTH-$GAPS*3)/2 - $BORDER_OFFSET_X )) \
			$(( ($SCREEN_HEIGHT-$POLYBAR_Y-$GAPS*4)/3 - $BORDER_OFFSET_Y )) \
		windowmove \
			$(( $SCREEN_WIDTH/2 + $GAPS/2 )) \
			$(( ($SCREEN_HEIGHT-$POLYBAR_Y)/2 + $POLYBAR_Y - ($SCREEN_HEIGHT-$POLYBAR_Y-$GAPS*4)/6 ))
	exit
fi

# +--------+--------+
# |        |        |
# +--------+--------+
# |        |        |
# +--------+--------+
# |        |XXXXXXXX|
# +--------+--------+
if [ $1 = "6-right-down" ]; then
	xdotool getactivewindow \
		windowsize \
			$(( ($SCREEN_WIDTH-$GAPS*3)/2 - $BORDER_OFFSET_X )) \
			$(( ($SCREEN_HEIGHT-$POLYBAR_Y-$GAPS*4)/3 - $BORDER_OFFSET_Y )) \
		windowmove \
			$(( $SCREEN_WIDTH/2 + $GAPS/2 )) \
			$(( ($SCREEN_HEIGHT-$POLYBAR_Y)/2 + $POLYBAR_Y + ($SCREEN_HEIGHT-$POLYBAR_Y+$GAPS*2)/6 ))
	exit
fi

