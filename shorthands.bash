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
