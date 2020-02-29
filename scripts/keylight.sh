#!/bin/bash
BASE_PATH=/sys/devices/platform/tuxedo_keyboard
STATE_PATH=$BASE_PATH/state

# functions
function print_usage ()
{
	echo 'USAGE:'
	echo "    -t | --toggle-state    -> Turn on/off keyboard light"
	echo ""
	echo "    -h | --help            -> Print this message"
}

# check parameters
if [[ $# -eq 0 ]]; then print_usage; fi;
while [[ $# -gt 0 ]]; do
	case "$1" in
		-t | --toggle-state)
			curState=$(cat $STATE_PATH)
			echo "Current State: $curState"

			newState=$([ $curState -eq 0 ] && echo "1" || echo "0")
			echo "Setting to: $newState"

			echo $newState > $STATE_PATH
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
