#!/usr/bin/env bash
# -*- mode: sh; fill-column: 72 -*-
#
#
########################################################################
## (c) Adam Liter 2015 under Creative Commons                         ##
## Attribution-NonCommercial-ShareAlike 4.0 International License     ##
########################################################################
#
#
########################################################################
## TODO                                                               ##
##                                                                    ##
##   - At some point, it would be nice to turn this into a portable   ##
##     shell script so that it can be executed with /bin/sh           ##
##                                                                    ##
########################################################################
#
#


########################################################################
## Exiting and debugging                                              ##
########################################################################
### Exit when a command fails
set -o errexit
### Exit when a command in a series of pipes fails
set -o pipefail
### Exit when there is an undeclared variable
set -o nounset
### Trace what gets executed (for debugging)
#set -o xtrace

########################################################################
## Define a list of the files to be looped over                       ##
########################################################################
FILES="bash_aliases bash_profile bashrc .emacs.d gitconfig profile \
tmux.conf zlogin zshrc OpenPGP/gpg.conf MailMate/Security.plist \
MailMate/Layouts/verticalThreadCorr.plist \
MailMate/Layouts/verticalThreadTag.plist \
MailMate/Layouts/widescreenThreadCorr.plist \
MailMate/Layouts/widescreenThreadTag.plist \
KeyBindings/DefaultKeyBinding.dict"

########################################################################
## Create directory for MailMate layouts                              ##
########################################################################
echo "Creating directory for MailMate layouts"
mkdir -p "${HOME}/Library/Application Support/MailMate/Resources/Layouts/Mailboxes"

########################################################################
## Create directory for keybindings                                   ##
########################################################################
echo "Creating directory for key bindings"
mkdir -p "${HOME}/Library/KeyBindings"

########################################################################
## Symlink all of the files                                           ##
########################################################################
echo "Symlinking configuration files and dotfiles based on the OS..."
for i in $FILES; do
    if [[ "${i}" == ".emacs.d" ]] ; then
	## Put Emacs directory in the right place
	ln -sf "${HOME}/config-files/${i}" "${HOME}"
    elif [[ "${i}" == "OpenPGP/gpg.conf" ]] ; then
	## Put gpg.conf in the right place
	ln -sf "${HOME}/config-files/${i}" "${HOME}/.gnupg"
    elif [[ "${i}" == "MailMate/Security.plist" ]] ; then
	## Put security config for MailMate in the right place
	ln -sf "${HOME}/config-files/${i}" \
	   "${HOME}/Library/Application Support/MailMate"
    elif echo "${i}" | grep -q "MailMate/Layouts/" ; then
	## Put Layout stuff in the right place
	ln -sf "${HOME}/config-files/${i}" \
	   "${HOME}/Library/Application Support/MailMate/Resources/Layouts/Mailboxes"
    elif [[ "${i}" == "KeyBindings/DefaultKeyBinding.dict" ]] ; then
	ln -sf "${HOME}/config-files/${i}" \
	   "${HOME}/Library/KeyBindings"
    else
	## All other dotfiles
	ln -sf "${HOME}/config-files/dotfiles/${i}" "${HOME}/.${i}"
    fi
done
