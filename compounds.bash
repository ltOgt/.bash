# create directory and change into it
mkcd ()
{
	mkdir -p -- "$1" && cd -P -- "$1"
}


# change directry and list its contents
cdl ()
{
	cd -P -- "$1" && ls
}
alias cl=cdl


# move up a directory
cd.. ()
{
	cd -P -- ".."
}
.. ()
{
	cd -P -- ".."
}


# copy SRC file to DEST path while creating missing patents in DEST
cpwp ()
{
	if [[ 2 -eq $# ]]; then
		mkdir -p $2 && cp $1 $2
	else
		echo "Expected SRC and DEST"
	fi
}


# find file (by name) in directory tree below current root node
frep ()
{
	find . -type f | grep $@
}


# shutdown wrapper
bye ()
{
	echo "DON'T FORGET TO MUTE"
	read -p "Shutdown now? [y/N] " answer
	if [[ $answer == "y" ]] || [[ $answer == "Y" ]]; then
		shutdown 0
	fi
}


# print without any color
# . mainly usefull for ntfs filesystems
# . particullarly lazy solution instead of actually fixing the problem
lg ()
{
	ls -l -a $1 | grep -E '*'
}


# show only .tex files
lt ()
{
	ls -l -a $1 | box-grep -E '*.tex|$'
}


# show only hidden
alias la='ls -a | grep "^\."'


# find broken vim files (exisitng *.swp files without open session)
alias broken='find . -type f | grep -E "*.swp" | rev | cut -d " " -f 1 | rev'


# (un-)mount external ntfs partitioned hard drive
alias wmnt='sudo mount -t ntfs-3g $(sudo fdisk -l | grep NTFS | cut -f1 -d" ") /mnt/ntfs/ && echo "done"'
alias wumnt='sudo umount $(sudo fdisk -l | grep NTFS | cut -f1 -d" ") && echo "done"'


# back light permission
# . lazy workaround to make hacky script for brightness control work
alias blp='sudo chmod a+w /sys/class/backlight/intel_backlight/brightness'


# reset terminal
alias ö='cd && source ~/.bashrc && clear'


# List storage devices with their type
alias disktype='lsblk -d -o name,rota | sed s/1/HDD/g | sed s/0/SSD/g'


# Convert svg to pdf
# . requires rsvg-convert
alias s2p='rsvg-convert -f pdf -o'


# Command line translation tools
# . requires trans
# : https://github.com/soimort/translate-shell
tde () 					#german
{
	trans {=de} "$*"
}
tnl () 					#dutch
{
	trans {=nl} "$*"
}
tus ()					#english
{
	trans {=eng} "$*"
}
# Synonym / Antonym
# . requires wordnet
tsyn ()                 # english synonyms
{
	wn "$*" -n1 -synsn -synsv -synsa -synsr | grep -E "Synonym|Similarity|=>" | red-grep -E "noun|verb|adv|adj|$" | ul-grep -E "^Synonym.*$|^Similarity.*$|$"
}
tant ()                 # english synonyms
{
	wn "$*" -n1 -antsn -antsv -antsa -antsr | grep -E "Antonym|Similarity|=>" | red-grep -E "noun|verb|adv|adj|$" | ul-grep -E "^Antonym.*$|^Similarity.*$|$"
}








