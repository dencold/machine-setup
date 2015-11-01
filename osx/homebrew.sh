#!/usr/bin/env bash
# ---------------------------------------------------------------------------------------
# Homebrew is a package manager for the missing unix commands you wish you had on your 
# Mac. Learn more about the project here: http://brew.sh/
#
# This script takes care of installing homebrew and the collection of utilities that I
# like to have available on my OSX installs. Unlike the instructions from the homebrew
# docs, this script can handle the installation process without input from the user.
#
# Author: Dennis Coldwell (@dencold)
#

# install homebrew, but redirect stdin from /dev/null so there is no TTY, and thus, 
# no prompts for user input.
ruby \
  -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" \
  </dev/null


