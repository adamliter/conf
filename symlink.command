#!/bin/bash
#
# This is a bash file for symlinking
# all of the dotfiles in my GitHub repo
# called `dotfiles` into `~/`
#
# Written by Adam Liter
# Last updated on 2014-07-19

# Get a list of the files to be looped over
# This gets all dot files
# Except for the auto-save files from Emacs
# that end with `~`
FILES=$(find ~/dotfiles -name '.*[!~]')

# Now, we still want to get rid of 
# the .git directory
# and the .DS_Store file from Mac

# First, get rid of the .git directory
# Note that if there are no more files
# after all of the .git.* files
# then the last one will not be removed from $FILES
# because there won't be a space after it
# Since I have at least .zshrc (which will be after all
# of the .git.* files) I haven't bothered
# finding a way to fix this
# though I did try [ \n$] and [ \n\$], and neither
# of these worked
FILES=$(echo $FILES | awk '{ gsub(/\/Users\/adamliter\/dotfiles\/.git.* /, "") ; print }')

# But we want to keep .gitconfig, so we can append it
FILES="${FILES} /Users/adamliter/dotfiles/.gitconfig"

# Next, get rid of .DS_Store
FILES=${FILES/\/Users\/adamliter\/dotfiles\/.DS_Store/}

# Finally, symlink all of the files
for i in $FILES; do
    ln -s "$i" $HOME ;
done
