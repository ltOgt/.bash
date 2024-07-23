# open pdf files with zathura
alias pdf='zathura'
# open pdf file in presentation mode (like powerpoint)
alias ppt='zathura --mode presentation'

# Play media files with vlc media player
alias play=cvlc

# Open gifs with sxiv
alias gif='sxiv -a'

# Shorthand for jupyter-lab
alias lab="jupyter-lab --no-browser"

# Shorthand for chromium browser without toolbars etc (app mode)
function cap(){
	chromium-browser --app=$1
}
# cap but on macos
function chromeapp(){
	/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --app="$1"
}


# Quick test if connection is broken
alias p8='ping 8.8.8.8'

# Restart network manager
alias nmr='service network-manager restart'

# List available wireless networks
alias ndw='nmcli dev wifi'
# List actuve wireless network
alias ndwa='nmcli dev wifi | grep "\*"'

# Zoom in/out of terminal using custom script
if  command -v urxvt_zoom &> /dev/null
then
	alias zp='urxvt_zoom +'
	alias zm-='urxvt_zoom -'
	alias zs='urxvt_zoom s'
fi


# Print out commonly used (by me) syntax file for quick reference
#alias gidde="awk '/MEANING/,/^$/' ~/.vim/syntax/gid.vim"

# extend to my second screen at home
# i xrandr has tab completion to find devices
alias aocon='xrandr --output HDMI-2 --left-of eDP-1 --auto'
alias aocoff='xrandr --output HDMI-2 --off'

# for some reason screenkey works only on primary screen (--scr does not do anything)
# aocon above (i.e. xrandr --primary) always sets primary to left most screen
# in my case that is my secondary monito
# to get screenkey to the bottom right of the "secondary" (actual primary laptop):
# shift more than the width of the external monitor to right
# -> ends up on laptop screen
alias skey='screenkey -p fixed -g 500x50+3330+1030 --no-detach --key-mode composed --font-size small'
alias skeySingle='screenkey -p fixed -g 500x50+1400+1030 --no-detach --key-mode composed --font-size small'
# TODO check out alternatives to include mouse events as well (§ KmCaster )

# android development
alias emulate-allow='sudo chmod a+rw /dev/kvm'
alias emulate='~/Android/Sdk/emulator/emulator -avd device'

# clipboard
# // https://stackoverflow.com/a/27456981/7215915
# $ echo "foo" | setclip
alias setclip="xclip -selection c"
# $ getclip
# >> foo
alias getclip="xclip -selection c -o"

# installation
sai()
{
	sudo apt install $@
}

# symlink
lns()
{
	sudo ln -s $(pwd)/$1 /usr/local/bin/$2
}

# rebuild config from base only
makei3base()
{
	I3_CONFIG_PATH=~/.config/i3
	cat I3_CONFIG_PATH/config_base > I3_CONFIG_PATH/config
}

gidde()
{
echo ">	    Note"
echo ".	    Side-Note"
echo "(..)	Relativation, side-note"
echo ""
echo "<	    Counter-Point, Alternative"
echo "^	    Claim"
echo "°	    Idea"
echo ""
echo "?	    Question"
echo ":	    Explanation"
echo ":=	    Definition"
echo "^=	    Equal Meaning"
echo "~	    Maybe / Approximation / Like"
echo "/	    opposite, difference"
echo "§	    Example"
echo "¬	    not  (AltGr+6)"
echo "!=	    not"
echo ""
echo "i	    Info (some importance)"
echo "!	    Important"
echo "!!	    Very Important"
echo ""
echo "0	    Goal/Aim/Focus"
echo "S	    Error / Problem"
echo "=	    Solution"
echo "x	    Condition"
echo ""
echo "->	    Follow"
echo "=>	    Conclusion"
echo "<-	    Reason"
echo ""
echo "1)	    Enumeration"
echo "--	    Option / Type"
echo "+	    Pro"
echo "-	    Contra"
echo ""
echo "//	    (internet) source"
echo "$	    Command-example"
echo ">>	    Code-example"
echo "::	    Code-output"
echo "|-	    (Sub-)Directory"
echo ""
echo "E	    parent"
echo "e	    is element of parent"
echo "00	    overview"
echo ""
echo "*	    reference"
echo "#	    Inner-Document Reference"
echo "{TAG}	Tag"
echo "[AB]~	Abbreviation"
echo ""
echo "d	    Date"
echo "v	    Location"
echo "@	    Person"
echo ""
echo "**	    Comment"
echo "_	    Continued on next line"
echo "|	    Chain symbols"
echo "{..}	Inline side branch / Comment"
echo ""
echo "[ ]	    TODO"
echo "[x]	    TODO - Done"
echo "[*]	    TODO - Active"
echo "[?]	    TODO - Unsure"
echo "[!]	    TODO - Priority"
echo "[p]	    TODO - Postponed"
echo "[~]	    TODO - Partly Finished / On Hold"
echo "[-]	    TODO - Closed / Deprecated"
}

alias brightness="xrandr --output eDP-1 --brightness"
alias brightness_low="xrandr --output eDP-1 --brightness 0.5"
alias brightness_min="xrandr --output eDP-1 --brightness 1"


alias code.="code ."
alias code,="code ."
alias c.="code ."
alias c,="code ."

alias brewfix="sudo chown -R $(whoami) /opt/homebrew"


alias make10gb="mkfile -n 10g temp_10GB_file"

