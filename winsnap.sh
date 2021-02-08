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

# Screen width and height without padding and outer gaps
SWWP=$(( SCREEN_W - PADDING_LEFT - PADDING_RIGHT  - 2 * GAPS ))
SHWP=$(( SCREEN_H - PADDING_TOP  - PADDING_BOTTOM - 2 * GAPS ))

case "$1" in

# +---------+
# |         |
# |         |
# |         |
# +---------+

"fullwin") winssp \
	$(( PADDING_LEFT + GAPS )) \
	$(( PADDING_TOP  + GAPS )) \
	$(( SWWP )) \
	$(( SHWP )) ;;

# +----+----+
# |    |    |
# |    |    |
# |    |    |
# +----+----+

# Vertical half left
"vhalfl") winssp \
	$(( PADDING_LEFT + GAPS )) \
	$(( PADDING_TOP  + GAPS )) \
	$(( ( SWWP - GAPS ) / 2 )) \
	$SHWP ;;

# Vertical half right
"vhalfr") winssp \
	$(( PADDING_LEFT + ( SWWP + 3 * GAPS ) / 2 )) \
	$(( PADDING_TOP  + GAPS )) \
	$(( ( SWWP - GAPS ) / 2 )) \
	$SHWP ;;

# +---------+
# |         |
# +---------+
# |         |
# +---------+

# Horizontal half top
"hhalft") winssp \
	$(( PADDING_LEFT + GAPS )) \
	$(( PADDING_TOP  + GAPS )) \
	$SWWP \
	$(( ( SHWP - GAPS ) / 2 )) ;;

# Horizontal half bottom
"hhalfb") winssp \
	$(( PADDING_LEFT + GAPS )) \
	$(( PADDING_TOP  + ( SHWP + 3 * GAPS ) / 2 )) \
	$SWWP \
	$(( ( SHWP - GAPS ) / 2 )) ;;

# +----+----+
# |    |    |
# +----+----+
# |    |    |
# +----+----+

# 4-grid left top
"4gridlt") winssp \
	$(( PADDING_LEFT + GAPS )) \
	$(( PADDING_TOP  + GAPS )) \
	$(( ( SWWP - GAPS ) / 2 )) \
	$(( ( SHWP - GAPS ) / 2 ));;

# 4-grid left bottom
"4gridlb") winssp \
	$(( PADDING_LEFT + GAPS )) \
	$(( PADDING_TOP  + ( SHHP + 3 * GAPS ) / 2 )) \
	$(( ( SWWP - GAPS ) / 2 )) \
	$(( ( SHWP - GAPS ) / 2 ));;

# 4-grid right top
"4gridrt") winssp \
	$(( PADDING_LEFT + ( SHWP + 3 * GAPS ) / 2 )) \
	$(( PADDING_TOP  + GAPS )) \
	$(( ( SWWP - GAPS ) / 2 )) \
	$(( ( SHWP - GAPS ) / 2 ));;

# 4-grid right bottom
"4gridrb") winssp \
	$(( PADDING_LEFT + ( SHWP + 3 * GAPS ) / 2 )) \
	$(( PADDING_TOP  + ( SHHP + 3 * GAPS ) / 2 )) \
	$(( ( SWWP - GAPS ) / 2 )) \
	$(( ( SHWP - GAPS ) / 2 ));;

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
