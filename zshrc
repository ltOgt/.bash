# custom bash path
cbp=~/.bash


command_exists ()
{
  command -v "$1" >/dev/null 2>&1
}

# Custom grep formating (e.g. underline match)
source $cbp/grep.bash

# Variables
source $cbp/exports.bash

# Compound Commands (e.g., mkdir + cd = mkcd)
source $cbp/compounds.bash
source $cbp/shorthands.bash

# Git shorthands
source $cbp/git.bash

# Flutter shorthands
source $cbp/flutter.bash

# Dgraph shortcuts
source $cbp/dgraph.bash

# Code Shortcuts
source $cbp/code.bash


# auto corrections
alias ös='ls'


# sourcing
# . bashrc
alias sob="source ~/.zshrc"
# source inputrc <M>apping
# . inputrc mappings
alias som="bind -f ~/.inputrc"

aenv ()
{
	source activate $@
}

PATH="~/.bash/scripts/:${PATH}"
export PATH
