#!/usr/bin/env bash
# ---------------------------------------------------------------------------------------
# Installation script for miscelaneous packages. This script should be last in 
# the run queue, as it may depend on things like Go or python being installed first.
#
# author: @dencold
#

echo "- Installing misc scripts"

#-----------------------------------------------------------------------------------
# Install scripts
# - executes the individual installation scripts
#-----------------------------------------------------------------------------------
# install party parrot!
go get -u github.com/jmhobbs/terminal-parrot
mv $HOME/bin/terminal-parrot $HOME/bin/parrot

# install tis
cp -p bin/tis $HOME/bin/tis

# install base16 for pretty shell/vim themes
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
