#!/bin/bash
BASE_PATH=/sys/devices/platform/tuxedo_keyboard
STATE_PATH=$BASE_PATH/state

# functions
function print_usage ()
{
	echo 'USAGE:'
	echo "    keylight ([ -t | -c COLOR ] | [ -h | ])"
	echo ""
	echo "    -t | --toggle-state    -> Turn on/off keyboard light"
	echo "    -c | --color           -> Set keyboard color to COLOR"
	echo "                              COLOR := [0-9A-F]{6}"
	echo ""
	echo "    -h | --help | <empty>  -> Print this message"
}

function _set_keyboard_state () {
	echo "$1" > $STATE_PATH
}
function _get_keyboard_state () {
	echo "$(cat $STATE_PATH)"
}
function turn_on_light () {
	_set_keyboard_state "1"
}
function turn_off_light () {
	_set_keyboard_state "0"
}
function toggle_state () {
	if [ $(_get_keyboard_state) -eq 0 ]
	then
		turn_on_light
	else
		turn_off_light
	fi
}

# check parameters
if [[ $# -eq 0 ]]; then print_usage; fi;
while [[ $# -gt 0 ]]; do
	case "$1" in
		-t | --toggle-state)
			toggle_state
			;;
		-c | --color)
			if [[ $# -eq 1 ]]; then
				echo "$1 requires a COLOR to be passed!"
				exit 1
			fi
			shift
			color=$1
			colorrgx="\[0-9A-Fa-f\]\{6\}"
			if ! [[ $entry =~ $colorgx ]]; then
				echo "$1 is not in the propper format! ($colorrgx)"
				exit 1
			fi
			echo "$color"
			exit 0
			# TODO the below does not work since these are not actual files
			# The GUI version does seem to simply override these files however
			# ... and it works; probably does something else
			#echo "$color" | sudo tee $BASE_PATH/color_center
			#echo "$color" | sudo tee $BASE_PATH/color_right
			#echo "$color" | sudo tee $BASE_PATH/color_left
			#echo "$color" | sudo tee $BASE_PATH/color_extra
			;;
		-h | --help)
			print_usage
			exit 0
			;;
		*)
			echo "<$1> not an option. Try --help."
			;;
	esac
	# shift out parsed option
	shift
done

echo "done"
exit 0
