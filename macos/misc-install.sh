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

