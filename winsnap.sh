#!/bin/sh

# Screen size for calculations
SCREEN_W=1920
SCREEN_H=1080

# Padding from screen sides (for things like docks)
PADDING_TOP=14
PADDING_BOTTOM=0
PADDING_LEFT=0
PADDING_RIGHT=0

# Gap size
GAPS=10

# Window decorations introduce offset
WIN_DECOR_SIZE_TOP=2
WIN_DECOR_SIZE_BOTTOM=2
WIN_DECOR_SIZE_LEFT=2
WIN_DECOR_SIZE_RIGHT=2

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
	$(( ( SHWP - GAPS ) / 2 )) ;;

# 4-grid left bottom
"4gridlb") winssp \
	$(( PADDING_LEFT + GAPS )) \
	$(( PADDING_TOP  + ( SHWP + 3 * GAPS ) / 2 )) \
	$(( ( SWWP - GAPS ) / 2 )) \
	$(( ( SHWP - GAPS ) / 2 )) ;;

# 4-grid right top
"4gridrt") winssp \
	$(( PADDING_LEFT + ( SWWP + 3 * GAPS ) / 2 )) \
	$(( PADDING_TOP  + GAPS )) \
	$(( ( SWWP - GAPS ) / 2 )) \
	$(( ( SHWP - GAPS ) / 2 )) ;;

# 4-grid right bottom
"4gridrb") winssp \
	$(( PADDING_LEFT + ( SWWP + 3 * GAPS ) / 2 )) \
	$(( PADDING_TOP  + ( SHWP + 3 * GAPS ) / 2 )) \
	$(( ( SWWP - GAPS ) / 2 )) \
	$(( ( SHWP - GAPS ) / 2 )) ;;

# +---+---+---+
# |   |   |   |
# |   |   |   |
# |   |   |   |
# +---+---+---+

# 3-grid vertical left
"3vgridl") winssp \
	$(( PADDING_LEFT + GAPS )) \
	$(( PADDING_TOP  + GAPS )) \
	$(( ( SWWP - 2 * GAPS ) / 3 )) \
	$SHWP ;;

# 3-grid vertical middle
"3vgridm") winssp \
	$(( PADDING_LEFT + ( SWWP + 4 * GAPS ) / 3 )) \
	$(( PADDING_TOP  + GAPS )) \
	$(( ( SWWP - 2 * GAPS ) / 3 )) \
	$SHWP ;;

# 3-grid vertical right
"3vgridr") winssp \
	$(( PADDING_LEFT + ( 2 * SWWP + 5 * GAPS ) / 3 )) \
	$(( PADDING_TOP  + GAPS )) \
	$(( ( SWWP - 2 * GAPS ) / 3 )) \
	$SHWP ;;

# +---+---+---+
# |   |   |   |
# +---+---+---+
# |   |   |   |
# +---+---+---+

# 6-grid horizontal top left
"6hgridtl") winssp \
	$(( PADDING_LEFT + GAPS )) \
	$(( PADDING_TOP  + GAPS )) \
	$(( ( SWWP - 2 * GAPS ) / 3 )) \
	$(( ( SHWP - GAPS ) / 2 )) ;;

# 6-grid horizontal top middle
"6hgridtm") winssp \
	$(( PADDING_LEFT + ( SWWP + 4 * GAPS ) / 3 )) \
	$(( PADDING_TOP  + GAPS )) \
	$(( ( SWWP - 2 * GAPS ) / 3 )) \
	$(( ( SHWP - GAPS ) / 2 )) ;;

# 6-grid horizontal top right
"6hgridtr") winssp \
	$(( PADDING_LEFT + ( 2 * SWWP + 5 * GAPS) / 3 )) \
	$(( PADDING_TOP  + GAPS )) \
	$(( ( SWWP - 2 * GAPS ) / 3 )) \
	$(( ( SHWP - GAPS ) / 2 )) ;;

# 6-grid horizontal bottom left
"6hgridbl") winssp \
	$(( PADDING_LEFT + GAPS )) \
	$(( PADDING_TOP  + ( SHWP + 3 * GAPS ) / 2 )) \
	$(( ( SWWP - 2 * GAPS ) / 3 )) \
	$(( ( SHWP - GAPS ) / 2 )) ;;

# 6-grid horizontal bottom middle
"6hgridbm") winssp \
	$(( PADDING_LEFT + 2 * GAPS + ( SWWP - 2 * GAPS ) / 3 )) \
	$(( PADDING_TOP  + ( SHWP + 3 * GAPS ) / 2 )) \
	$(( ( SWWP - 2 * GAPS ) / 3 )) \
	$(( ( SHWP - GAPS ) / 2 )) ;;

# 6-grid horizontal bottom right
"6hgridbr") winssp \
	$(( PADDING_LEFT + ( 2 * SWWP + 5 * GAPS) / 3 )) \
	$(( PADDING_TOP  + ( SHWP + 3 * GAPS ) / 2 )) \
	$(( ( SWWP - 2 * GAPS ) / 3 )) \
	$(( ( SHWP - GAPS ) / 2 )) ;;

esac

