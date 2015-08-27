#!/usr/bin/env bash
# -*- mode: sh; fill-column: 72 -*-
#
#
########################################################################
## This is a bash script for uninstalling Homebrew|Linuxbrew.         ##
##                                                                    ##
##                                                                    ##
## (c) Adam Liter 2015 under Creative Commons                         ##
## Attribution-NonCommercial-ShareAlike 4.0 International License     ##
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
source "${HOME}/config-files/DetectOS.sh"

########################################################################
## Generate a .Brewfile for use with Homebrew bundle                  ##
########################################################################
source "${HOME}/config-files/Homebrew/BrewfileGen.sh"