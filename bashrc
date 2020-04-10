# custom bash path
cbp=~/.bash


command_exists ()
{
  command -v "$1" >/dev/null 2>&1
}


# Pre-Defined stuff that needs to be cleaned up and replaced
source $cbp/ubuntu.bash


# Custom grep formating (e.g. underline match)
source $cbp/grep.bash

# Variables
source $cbp/exports.bash

# Compound Commands (e.g., mkdir + cd = mkcd)
source $cbp/compounds.bash
source $cbp/shorthands.bash

# Hotspot Management (NOT INCLUDED IN REPOSITORY)
#source $cbp/hotspot.bash

# Git shorthands
source $cbp/git.bash

# Flutter shorthands
source $cbp/flutter.bash

# Dgraph shortcuts
source $cbp/dgraph.bash


# auto corrections
alias ös='ls'


# sourcing
# . bashrc
alias sob="source ~/.bashrc"
# source inputrc <M>apping
# . inputrc mappings
alias som="bind -f ~/.inputrc"

aenv ()
{
	source activate $@
}


# BINDS ----------------------------------------------------
# Keycodes can be found by ´´´$ cat <Enter>´´´ and then hitting the desired keys. "^" must be replaced by "\e"

# check if shell runs in interactive mode
if [[ $- == *i* ]] ; then

	set -o vi

	urxvt_zoom s $(cat ~/.config/urxvt_font_size)

	# Alt+P => increase font size
	bind -x '"\ep": "urxvt_zoom + 5"'
	# Alt+M => decrease font size
	bind -x '"\em": "urxvt_zoom - 5"'

	# go back a directory with Alt+Left
	# ^[^[[D
	# ^[^[[A

	bind '"\C-G": "got -s \n"'

	# vim mode in bash
	# Ctrl+X Ctrl+E

fi

# import device specific settings
source ~/.bash/device_specific.bash

# OTHER ----------------------------------------------------
# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
# sequence file will be deleted by bgswap reset
[[ -f ~/.cache/wal/sequences ]] && (cat ~/.cache/wal/sequences &)

PATH="~/.bash/scripts/:${PATH}"
export PATH
