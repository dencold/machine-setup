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

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# install homebrew, but redirect stdin from /dev/null so there is no TTY, and thus, 
# no prompts for user input.
ruby \
  -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" \
  < /dev/null

# finally, a vim install that isn't 5 years old.
brew install vim --with-lua

# the silver searcher, needed for ctl-p vim extension, grep replacement.
brew install ag

# bash completion
brew install bash-completion

# install the latest version of node
brew install node

# install golang
brew install go

# install bzr, requried for installing some package dependencies
brew install bzr

