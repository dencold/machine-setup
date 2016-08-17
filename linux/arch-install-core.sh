#!/usr/bin/env bash
# ---------------------------------------------------------------------------------------
#
# Author: Dennis Coldwell (@dencold)
#

# ensure that arch is up to date
pacman --noconfirm -Syu

# the go programming language
pacman --noconfirm -S go

# node and npm
pacman --noconfirm -S nodejs npm

# curl
pacman --noconfirm -S curl
