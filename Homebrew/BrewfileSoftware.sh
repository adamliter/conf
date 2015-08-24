#!/usr/bin/env bash
# -*- mode: sh; fill-column: 72 -*-
#
#
########################################################################
## This is a bash script for getting an array of the software that    ##
## I use and install via Homebrew|Linuxbrew.                          ##
##                                                                    ##
##                                                                    ##
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
## Initialize the array                                               ##
########################################################################
declare -a BREW_SFTWR

########################################################################
## Editor(s)                                                          ##
########################################################################
BREW_SFTWR=("${BREW_SFTWR[@]:+${BREW_SFTWR[@]}}" "emacs")

########################################################################
## Encryption stuff                                                   ##
########################################################################
BREW_SFTWR=("${BREW_SFTWR[@]:+${BREW_SFTWR[@]}}" "gnupg")
BREW_SFTWR=("${BREW_SFTWR[@]:+${BREW_SFTWR[@]}}" "gnupg2")
BREW_SFTWR=("${BREW_SFTWR[@]:+${BREW_SFTWR[@]}}" "openssl")

########################################################################
## Password manager(s)                                                ##
########################################################################
BREW_SFTWR=("${BREW_SFTWR[@]:+${BREW_SFTWR[@]}}" "pass")

########################################################################
## TeX related stuff                                                  ##
########################################################################
BREW_SFTWR=("${BREW_SFTWR[@]:+${BREW_SFTWR[@]}}" "bib-tool")
BREW_SFTWR=("${BREW_SFTWR[@]:+${BREW_SFTWR[@]}}" "pandoc")

########################################################################
## Programming                                                        ##
########################################################################
BREW_SFTWR=("${BREW_SFTWR[@]:+${BREW_SFTWR[@]}}" "python")
BREW_SFTWR=("${BREW_SFTWR[@]:+${BREW_SFTWR[@]}}" "python3")
#BREW_SFTWR=("${BREW_SFTWR[@]:+${BREW_SFTWR[@]}}" "r")

########################################################################
## Version Control System(s) and related stuff                        ##
########################################################################
BREW_SFTWR=("${BREW_SFTWR[@]:+${BREW_SFTWR[@]}}" "git")
BREW_SFTWR=("${BREW_SFTWR[@]:+${BREW_SFTWR[@]}}" "hub")
