#!/bin/bash
#
# This is a bash script for symlinking all of the dot files
# in my GitHub repo `dotfiles` into their proper place
#
# On a Mac, you can run it by double clicking `symlink.command`
# in an open Finder window, otherwise you can run it from the
# command line, too, by invoking `./symlink.command`

# Define a list of the files to be looped over
FILES=".bash_profile .bashrc .emacs.d .gitconfig .profile .zlogin .zshrc OpenPGP/gpg.conf MailMate/Security.plist"

# Symlink all of the files
for i in $FILES; do
    if [ "$i" == ".emacs.d" ] ; then
    	ln -sf "/Users/adamliter/config-files/$i" "$HOME"
    elif [ "$i" == "OpenPGP/gpg.conf" ] ; then
		ln -sf "/Users/adamliter/config-files/$i" "$HOME/.gnupg"
    elif [ "$i" == "MailMate/Security.plist" ] ; then
    	ln -sf "/Users/adamliter/config-files/$i" "$HOME/Library/Application Support/MailMate"
    else
		ln -sf "/Users/adamliter/config-files/dotfiles/$i" "$HOME"
    fi
done
