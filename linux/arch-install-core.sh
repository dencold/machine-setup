#!/usr/bin/env bash
# ---------------------------------------------------------------------------------------
#
# Author: Dennis Coldwell (@dencold)
#

# ensure that arch is up to date
pacman --noconfirm -Syu

# base-devel, needed for tools like make, gcc, etc.
pacman -S --noconfirm --needed base-devel

# the go programming language
pacman --noconfirm -S go

# node and npm
pacman --noconfirm -S nodejs npm

# curl
pacman --noconfirm -S curl

# tmux - terminal multiplexer
pacman --noconfirm -S tmux
