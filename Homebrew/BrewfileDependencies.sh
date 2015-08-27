#!/usr/bin/env bash
# -*- mode: sh; fill-column: 72 -*-
#
#
########################################################################
## This is a bash script for getting an array of the dependencies     ##
## afor the software that I use and install via Homebrew|Linuxbrew.   ##
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
## Initialize the array                                               ##
########################################################################
declare -a BREW_DEPS

########################################################################
## Dependencies for Emacs                                             ##
##                                                                    ##     
## Last updated on 2015-08-23                                         ##
########################################################################
BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "xz")
BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "pkg-config")

########################################################################
## Dependencies for gnupg                                             ##
##                                                                    ##     
## Last updated on 2015-08-23                                         ##
########################################################################
### None

########################################################################
## Dependencies for gnupg2                                            ##
##                                                                    ##     
## Last updated on 2015-08-23                                         ##
########################################################################
BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "libgpg-error")
BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "libgcrypt")
BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "libksba")
BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "libassuan")
BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "pinentry")
BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "pth")
BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "gpg-agent")
BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "dirmngr")
BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "libusb")
BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "libusb-compat")

########################################################################
## Dependencies for openssl                                           ##
##                                                                    ##     
## Last updated on 2015-08-23                                         ##
########################################################################
### None

########################################################################
## Dependencies for pass                                              ##
##                                                                    ##     
## Last updated on 2015-08-23                                         ##
########################################################################
BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "gpg")
BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "pwgen")
BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "tree")
BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "gettext")
BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "gnu-getopt")

########################################################################
## Dependencies for tesseract                                         ##
##                                                                    ##     
## Last updated on 2015-08-24                                         ##
########################################################################
#BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "autoconf")
#BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "automake")
#BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "libtool")
#BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "pkg-config")

########################################################################
## Dependencies for bib-tool                                          ##
##                                                                    ##     
## Last updated on 2015-08-23                                         ##
########################################################################
### None

########################################################################
## Dependencies for pandoc                                            ##
##                                                                    ##     
## Last updated on 2015-08-23                                         ##
########################################################################
BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "gmp")

########################################################################
## Dependencies for tor                                               ##
##                                                                    ##     
## Last updated on 2015-08-24                                         ##
########################################################################
BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "libevent")
BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "openssl")

########################################################################
## Dependencies for torsocks                                          ##
##                                                                    ##     
## Last updated on 2015-08-24                                         ##
########################################################################
BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "autoconf")
BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "automake")
BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "libtool")

########################################################################
## Dependencies for python                                            ##
##                                                                    ##     
## Last updated on 2015-08-23                                         ##
########################################################################
BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "pkg-config")
BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "readline")
BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "sqlite")
BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "gdbm")
BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "openssl")

########################################################################
## Dependencies for python3                                           ##
##                                                                    ##     
## Last updated on 2015-08-23                                         ##
########################################################################
BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "xz")
BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "pkg-config")
BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "readline")
BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "sqlite")
BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "gdbm")
BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "openssl")

########################################################################
## Dependencies for R                                                 ##
##                                                                    ##     
## Last updated on 2015-08-23                                         ##
########################################################################
#BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "gmp")
#BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "mpfr")
#BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "libmpc")
#BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "isl")
#BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "gcc")
#BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "readline")
#BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "gettext")
#BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "jpeg")
#BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "libtiff")
#BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "pcre")
#BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "libpng")
#BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "xz")
#BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "freetype")
#BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "fontconfig")
#BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "pixman")
#BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "libffi")
#BREW_DEPS=("${BREW_DEPS[@]:+${BREW_DEPS[@]}}" "gl")

########################################################################
## Dependencies for git                                               ##
##                                                                    ##     
## Last updated on 2015-08-23                                         ##
########################################################################
### None

########################################################################
## Dependencies for hub                                               ##
##                                                                    ##     
## Last updated on 2015-08-23                                         ##
########################################################################
### None
