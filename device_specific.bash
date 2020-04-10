# TOUCHPAD ------------------------------------------------------
# (use <xinput list> to see devices and <xinput list-props [device-name]>)

setup_touchpad()
{
	deviceName="SynPS/2 Synaptics TouchPad"

	tappingIdent="Tapping Enabled ("
	scrollingIdent="Natural Scrolling Enabled ("

	tappingNumber=$(xinput list-props "$deviceName" | grep "$tappingIdent" | sed 's/.*(\(.*\)).*/\1/')
	scrollingNumber=$(xinput list-props "$deviceName" | grep "$scrollingIdent" | sed 's/.*(\(.*\)).*/\1/')

	xinput set-prop "$deviceName" $tappingNumber 1
	echo "$(xinput set-prop "$deviceName" $tappingNumber 1
)"
	xinput set-prop "$deviceName" $scrollingNumber 1
	echo "$(xinput set-prop "$deviceName" $scrollingNumber 1)"

	unset deviceName
	unset tappingIdent
	unset scrollingIdent
	unset tappingNumber
	unset scrollingNumber
}

# TOUCHPAD ------------------------------------------------------
# KEYBOARD ------------------------------------------------------
keyboard_settings()
{
	echo "color_left    {0x000000,...,0xFFFFFF}"
	echo "color_center  {0x000000,...,0xFFFFFF}"
	echo "color_right   {0x000000,...,0xFFFFFF}"
	echo "brightness    {0,...,255}"
	echo "mode          <MODES>"
	echo "state         0 (off), 1 (on)"
	echo ""
	echo "<MODES>"
	echo "              0 custom"
	echo "              1 breathe"
	echo "              2 cycle"
	echo "              3 dance"
	echo "              4 flash"
	echo "              5 random color"
	echo "              6 tempo"
	echo "              7 wave"
	echo ""
	echo "$ sudo tuxedo_keyboard ui"
	echo "___________________________________"
	read -p "PRESS ANY KEY TO CONTINUE TO EDITOR"
	vim /sys/devices/platform/tuxedo_keyboard/
}
# KEYBOARD ------------------------------------------------------
