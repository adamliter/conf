#!/bin/bash
#
# This is a bash file for symlinking
# all of the dotfiles in my GitHub repo
# called `dotfiles` into `~/`
#
# Written by Adam Liter
# Last updated on 2014-07-19

# Define a list of the files to be looped over
FILES=".bash_profile .bashrc .gitconfig .profile .zlogin .zshrc"

# Symlink all of the files
for i in $FILES; do
    ln -s "Users/adamliter/dotfiles/$i" $HOME ;
done
