#!/usr/bin/env bash
# -*- mode: sh; fill-column: 72 -*-
#
#
########################################################################
## This is a bash script for detecting the operating system. It is    ##
## taken from Franci Penov. The original can be found at              ##
## https://github.com/francip/bashrc/blob/master/configure_os         ##
## This version was taken from commit                                 ##
## 8447c947611197942bca7d8828e0c11867402872 authored on 2015-07-22    ##
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
## Detect the OS                                                      ##
########################################################################
echo "Detecting the operating system..."
if [[ $OSTYPE == darwin* ]]; then
    # Mac OS X
    BASH_OS_TYPE=MacOSX
    BASH_OS_RELEASE=`type sw_vers >/dev/null 2>&1 && sw_vers -productVersion`
    if [[ $OSTYPE == darwin14* ]]; then
        BASH_OS_DISTRO=Yosemite
    elif [[ $OSTYPE == darwin13* ]]; then
        BASH_OS_DISTRO=Mavericks
    elif [[ $OSTYPE == darwin12* ]]; then
        BASH_OS_DISTRO=MountainLion
    elif [[ $OSTYPE == darwin11* ]]; then
        BASH_OS_DISTRO=Lion
    elif [[ $OSTYPE == darwin10* ]]; then
        BASH_OS_DISTRO=SnowLeopard
    else
        # How to get the distro
        BASH_OS_DISTRO=Unknown
    fi
elif [[ $OSTYPE == linux-gnu ]]; then
    # Linux
    BASH_OS_TYPE=Linux
    if [[ -f /etc/lsb-release  ]] || type lsb_release >/dev/null 2>&1 ; then
        BASH_OS_DISTRO=`type lsb_release >/dev/null 2>&1 && lsb_release -i -s`
        BASH_OS_RELEASE=`type lsb_release >/dev/null 2>&1 && lsb_release -r -s`
    elif [[ -f /etc/debian_version ]]; then
        # Debian/Ubuntu
        # How to distinguish Debian vs. Ubuntu?
        BASH_OS_DISTRO=Debian
        # How to get the release
        BASH_OS_RELEASE=0
    elif [[ -f /etc/centos-release ]]; then
        # CentOS 6+
        BASH_OS_DISTRO=CentOS
        BASH_OS_RELEASE=`cat /etc/centos-release >/dev/null 2>&1 && cat /etc/centos-release | sed s/.*release\ // | sed s/\ .*//`
    elif [[ -f /etc/redhat-release ]]; then
        # RedHat/CentOS
        # How to distinguish CentOS vs. RedHat?
        BASH_OS_DISTRO=RedHat
        BASH_OS_RELEASE=`cat /etc/redhat-release >/dev/null 2>&1 && cat /etc/redhat-release | sed s/.*release\ // | sed s/\ .*//`
    else
        # How to get the distro
        BASH_OS_DISTRO=Unknown
        # How to get the release
        BASH_OS_RELEASE=0
    fi
elif [[ $OSTYPE == linux-gnueabi* ]]; then
    # Linux Embedded
    BASH_OS_TYPE=Linux
    if [[ -f /etc/debian_version ]]; then
        if [[ -f /etc/rpi-issue ]]; then
            # Raspbian
            BASH_OS_DISTRO=Raspbian
        else
            # Debian
            BASH_OS_DISTRO=Debian
        fi
        BASH_OS_RELEASE=`cat /etc/debian_version >/dev/null 2>&1 && cat /etc/debian_version`
    else
        # How to get the distro
        BASH_OS_DISTRO=Unknown
        # How to get the release
        BASH_OS_RELEASE=0
    fi
elif [[ $OSTYPE == msys* ]]; then
    # Linux
    BASH_OS_TYPE=Windows
    BASH_OS_DISTRO=Msys
    # How to get the OS version
    BASH_OS_RELEASE=0
else
    # What the heck are we running on???
    BASH_OS_TYPE=Unknown
    BASH_OS_DISTRO=Unknown
    BASH_OS_RELEASE=0
fi
