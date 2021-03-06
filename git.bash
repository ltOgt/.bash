# git alias
gits ()
{
	git status $@ | box-grep -E "up to date|up-to-date|ahead|behind|$" | box-grep -E "by [0-9]+ commit[s]*|$" | ul-grep -E "modified:|new file:|deleted:|renamed:|$"
}
gita ()
{
	git add $@
}
alias gita.='echo "git add ." && git add .'
alias git!='echo "git push" && git push'
alias gitup='echo "git push --set-upstream origin master" && git push --set-upstream origin master'
alias git?='echo "git fetch" && git fetch'
alias git#='echo "git merge" && git merge'
gitb(){
	git checkout -b "$@"
}
gitm ()
{
	git commit -m "$@"
}
gitam ()
{
	git add . && git commit -m "$@"
}
gitd ()
{
	if [[ $# -eq 0 ]]; then
		git diff
	else
		git difftool --tool=vimdiff $@
	fi
}



gitrab ()
{
git branch
read -p "Delete all branches except master? [y/N] " answer
if [[ $answer == "y" ]] || [[ $answer == "Y" ]]; then
	git branch | grep -ve " master$" | xargs git branch -D
fi
}


# branch name in console
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
generate_git_delim() {
	# Insert a line break if in a git repo (branch name takes more space)
	[[ "$(git branch 2> /dev/null)" == "" ]] && echo "$" || echo -e "\n$"
}
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion

	# extracted from ./ubuntu.bash
	# set a fancy prompt (non-color, unless we know we "want" color)
	case "$TERM" in
		xterm-color|*-256color) color_prompt=yes;;
	esac
	if [ "$color_prompt" = yes ]; then
		#   																						user  machine           path                                git
		delim=$([[ "$(git branch 2> /dev/null)" == "" ]] && echo "\n$" || echo "$")
		export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(parse_git_branch)$(generate_git_delim) '
		unset delim
	else
		PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
	fi
	unset color_prompt
else
	echo "bash-completion not installed!"
fi

	# If this is an xterm set the title to user@host:dir
	#case "$TERM" in
	#xterm*|rxvt*)
#		PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#		;;
#	*)
#		;;
#	esac

