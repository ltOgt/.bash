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

# Quick test if connection is broken
alias p8='ping 8.8.8.8'

# Restart network manager
alias nmr='service network-manager restart'

# List available wireless networks
alias ndw='nmcli dev wifi'
# List actuve wireless network
alias ndwa='nmcli dev wifi | grep "\*"'

# Zoom in/out of terminal using custom script
alias zp='urxvt_zoom +'
alias zm-='urxvt_zoom -'
alias zs='urxvt_zoom s'

# Print out commonly used (by me) syntax file for quick reference
alias gidde="awk '/MEANING/,/^$/' ~/.vim/syntax/gid.vim"

# extend to my second screen at home
# i xrandr has tab completion to find devices
alias aocon='xrandr --output HDMI-2 --right-of eDP-1 --auto'
alias aocoff='xrandr --output HDMI-2 --off'

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
