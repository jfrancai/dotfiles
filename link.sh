#!/bin/bash

############################
#
# Credits: @michaelcoyote
#
############################

# link.sh
# This script creates symlinks from the home directory
# to any desired dotfiles in ~/dotfiles
#
#
########## Variables
dfdir=~/.dotfiles      # dotfiles directory
olddir=~/.dotfiles_old # old dotfiles backup directory
# list of files/folders to symlink in homedir
files="config/gh/config.yml config/kitty/kitty.conf valgrindrc gitconfig"
##########

# function to support macos & linux w/o editing
function linkcount() {
	if [[ $OSTYPE == darwin* ]]; then
		stat -q -f %l -- "$1"
	else
		stat -c %h -- "$1"
	fi
}

# do all the work from the dotfiles dir
cd $dfdir || exit
mkdir -p $olddir

# move any existing dotfiles in homedir to backup dir, then create symlinks
for file in $files; do
	if [ -e "$dfdir"/"$file" ]; then # make sure source file exists
		if [[ $file == */* ]]; then
			# make sure parent dirs exist e.g. config/foo
			dir=$(dirname "$file")
			mkdir -p "$HOME"/."$dir"
		fi
		# Link back to the dotfile
		if [ -L ~/."$file" ]; then #check for existing symlink
			echo "Link exists for ~./$file"
		elif [[ "$(linkcount "$HOME"/."$file")" -gt 1 ]]; then
			echo "$HOME/.$file has more than one name, check for hard links."
		else
			if [ -e ~/."$file" ]; then # if .file exists, back up
				mkdir -p "$olddir"        # create dotfiles_old in homedir
				echo "Move ~/.$file to $olddir"
				mv ~/."$file" "$olddir"
			fi
			echo "Creating symlink to ~/.$file"
			ln -s "$dfdir"/"$file" ~/."$file"
		fi
	else
		echo "File $file is missing from $dfdir"
	fi
done

if [ -e ~/.config/nvim ]; then # if .file exists, back up
	mkdir -p "$olddir"            # create dotfiles_old in homedir
	echo "Move ~/.config/nvim/ to $olddir"
	mv ~/.config/nvim/ "$olddir"
fi
# create a simlink for nvim directory
ln -s "$dfdir"/config/nvim ~/.config/nvim
