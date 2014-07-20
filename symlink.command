#!/bin/bash
#
# This is a bash file for symlinking all of the dot files
# in my GitHub repo `dotfiles` into their proper place

# Define a list of the files to be looped over
FILES=".bash_profile .bashrc .emacs.d .gitconfig .profile .zlogin .zshrc gpg.conf"

# Symlink all of the files
for i in $FILES; do
	if [ "$i" == "gpg.conf" ] ; then
		ln -s "/Users/adamliter/dotfiles/$i" "$HOME/.gnupg"
	else
    	ln -s "/Users/adamliter/dotfiles/$i" "$HOME"
    fi
done
