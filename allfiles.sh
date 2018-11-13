#!/bin/bash
##########################################################################
# Shellscript:	allfiles - apply command to all files in all subdirectories
# Author     :	Shivam Sood <shivamsood89@gmail.com>
##########################################################################
# Description:
#
##########################################################################

PN=`basename "$0"`			# Program name
VER='1.2'

Usage () {
    echo >&2 "$PN - apply command to all files in all subdirectories, $VER
usage: $PN command [arg  ...]

The given command will be applied to all files in the current
and in all subdirectories -- USE WITH CARE."
    exit 1
}

[ $# -lt 1 ] && Usage

find * -type f -print | xargs "$@"
