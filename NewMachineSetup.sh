#!/usr/bin/env bash
# -*- mode: sh; fill-column: 72 -*-
#
#
########################################################################
## This is a bash script for setting up a new machine with the stuff  ##
## that I normally use.                                               ##
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
## USAGE                                                              ##
##                                                                    ##
##   1. 
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
## Detect the operating system                                        ##
########################################################################
echo "Detecting the operating system..."
source ${HOME}/config-files/DetectOS.sh

########################################################################
## Generate a .Brewfile for use with Homebrew bundle                  ##
########################################################################
echo "Generating a .Brewfile appropriate for the OS..."
source ${HOME}/config-files/Homebrew/BrewfileGen.sh

########################################################################
## Set up package manager and install stuff                           ##
########################################################################
source ${HOME}/config-files/Homebrew/HomebrewInstall.sh

########################################################################
## Symlink stuff into the home directory                              ##
########################################################################
#echo "Symlinking configuration files and dotfiles based on the OS..."
#source ${HOME}/config-files/Symlink.sh
