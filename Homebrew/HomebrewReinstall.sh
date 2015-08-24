#!/usr/bin/env bash
# -*- mode: sh; fill-column: 72 -*-
#
#
########################################################################
## This is a bash script for reinstalling Homebrew|Linuxbrew.         ##
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
source ${HOME}/config-files/Homebrew/HomebrewUninstall.sh

########################################################################
## Install Homebrew|Linuxbrew                                         ##
########################################################################
source ${HOME}/config-files/Homebrew/HomebrewInstall.sh
