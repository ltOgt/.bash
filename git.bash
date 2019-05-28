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

