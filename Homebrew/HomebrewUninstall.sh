#!/usr/bin/env bash
# -*- mode: sh; fill-column: 72 -*-
#
#
########################################################################
## This is a shell script for uninstalling Homebrew|Linuxbrew.        ##
##                                                                    ##
##                                                                    ##
## (c) Adam Liter 2015 under Creative Commons                         ##
## Attribution-NonCommercial-ShareAlike 4.0 International License     ##
########################################################################
#
#


########################################################################
## Detect the operating system                                        ##
########################################################################
echo "Detecting the operating system..."
source ${HOME}/config-files/DetectOS.sh

########################################################################
## Uninstall Homebrew|Linuxbrew                                       ##
########################################################################
if [ "${BASH_OS_TYPE}" = "MacOSX" ]; then
    echo "Uninstalling Homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
elif [ "${BASH_OS_TYPE}" = "Linux" ]; then
    echo "Uninstalling Linuxbrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/uninstall)"
fi
