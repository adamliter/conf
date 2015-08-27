#!/usr/bin/env bash
# -*- mode: sh; fill-column: 72 -*-
#
#
########################################################################
## This is a bash script for installing Homebrew|Linuxbrew and the    ##
## software that I use.                                               ##
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
## This file is not intended for direct execution                     ##
########################################################################
if [ "${BASH_SOURCE[0]}" = "$0" ]; then
    echo "This file is not intended for direct execution..."
    echo "Exiting..."
    exit
fi

########################################################################
## Install Homebrew|Linuxbrew                                         ##
########################################################################
### Check if Homebrew|Linuxbrew is already installed
if type brew >/dev/null 2>&1; then
    echo "Homebrew|Linuxbrew is already installed..."
    echo "Updating Homebrew|Linuxbrew instead..."
    brew update
### If not, check the OS to install the dependencies and either
### Homebrew or Linuxbrew
else
    if [ "${BASH_OS_TYPE}" = "MacOSX" ]; then
	## Xcode Command Line Tools are needed for install
	if pkgutil --pkg-info=com.apple.pkg.CLTools_Executables \
	| grep -q "No receipt"; then
	    echo "Need to figure out how to install Xcode Command Line"
	    echo "Tools from the command line. For now, please install"
	    echo "them manually and then rerun this script."
	    exit
	else
	    echo "Xcode Command Line Tools already installed..."
	fi
	## Install Homebrew on Mac OS X
	echo "Installing Homebrew..."
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    elif [ "${BASH_OS_TYPE}" = "Linux" ]; then
	if [ "${BASH_OS_DISTRO}" = "Debian" ]; then
	    ## Install Linuxbrew dependencies for Debian/Ubuntu
	    echo "Installing Debian/Ubuntu dependencies for Linuxbrew..."
	    sudo apt-get install build-essential curl git m4 ruby \
		 texinfo libbz2-dev libcurl4-openssl-dev libexpat-dev \
		 libncurses-dev zlib1g-dev
	fi
	## Install Linuxbrew
	echo "Installing Linuxbrew..."
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/linuxbrew/go/install)"
    fi
fi

########################################################################
## Tap Homebrew bundle                                                ##
########################################################################
if brew tap | grep "homebrew/bundle" >/dev/null 2>&1; then
    echo "Homebrew/bundle is already tapped..."
    echo "Updating Homebrew|Linuxbrew instead..."
    brew update
else
    echo "Tapping Homebrew/bundle..."
    brew tap Homebrew/bundle
fi
########################################################################
## Install stuff from Homebrew|Linuxbrew that I use                   ##
########################################################################
echo "Installing software specified in ${BREWFILE_LOC}..."
brew bundle --verbose --file="${BREWFILE_LOC}"

########################################################################
## Link applications                                                  ##
########################################################################
if [ "${BASH_OS_TYPE}" = "MacOSX" ]; then
    echo "Linking applications..."
    brew linkapps
fi
