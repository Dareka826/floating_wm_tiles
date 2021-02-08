#!/bin/sh

# Screen size for calculations
SCREEN_W=
SCREEN_H=

# Padding from screen sides (for things like docks)
PADDING_TOP=
PADDING_BOTTOM=
PADDING_LEFT=
PADDING_RIGHT=

# Gap size
GAPS=

# Window decorations introduce offset
WIN_DECOR_SIZE_TOP=
WIN_DECOR_SIZE_BOTTOM=
WIN_DECOR_SIZE_LEFT=
WIN_DECOR_SIZE_RIGHT=

# Window set size & position
# Args:
# $1 - x
# $2 - y
# $3 - w
# $4 - h
winssp() {
	[ $# -lt 4 ] && return 1 # Exit if not enough args

	xdotool getactivewindow \
		windowsize \
			$(( $3 - WIN_DECOR_SIZE_LEFT - WIN_DECOR_SIZE_RIGHT  )) \
			$(( $4 - WIN_DECOR_SIZE_TOP  - WIN_DECOR_SIZE_BOTTOM )) \
		windowmove $1 $2
}

# Screen width and height without padding to save calculations later
SWWP=$(( SCREEN_W - PADDING_LEFT - PADDING_RIGHT  ))
SHWP=$(( SCREEN_H - PADDING_TOP  - PADDING_BOTTOM ))

case "$1" in

# +---------+
# |         |
# |         |
# |         |
# +---------+

"fullwin") winssp \
	$(( PADDING_LEFT + GAPS )) \
	$(( PADDING_TOP  + GAPS )) \
	$(( SWWP - 2 * GAPS )) \
	$(( SHWP - 2 * GAPS )) ;;

# +----+----+
# |    |    |
# |    |    |
# |    |    |
# +----+----+

# +---------+
# |         |
# +---------+
# |         |
# +---------+

# +----+----+
# |    |    |
# +----+----+
# |    |    |
# +----+----+

# +---+---+---+
# |   |   |   |
# |   |   |   |
# |   |   |   |
# +---+---+---+

# +---+---+---+
# |   |   |   |
# +---+---+---+
# |   |   |   |
# +---+---+---+

esac
