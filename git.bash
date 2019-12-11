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
alias git?='echo "git fetch" && git fetch'
alias git#='echo "git merge" && git merge'
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


# branch name in console
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
	#   																						user  machine           path                                git
	export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(parse_git_branch)$ '
else
	echo "bash-completion not installed!"
fi
