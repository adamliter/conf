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
## Define a list of the files to be looped over                       ##
########################################################################
FILES=".bash_profile .bashrc .emacs.d .gitconfig .profile .zlogin \
.zshrc OpenPGP/gpg.conf MailMate/Security.plist"

########################################################################
## Symlink all of the files                                           ##
########################################################################
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
    else
	## All other dotfiles
	ln -sf "${HOME}/config-files/dotfiles/${i}" "${HOME}"
    fi
done
