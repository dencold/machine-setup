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

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils

# Install wget
brew install wget

# install lua, required for vim plugins
brew install lua

# finally, a vim install that isn't 5 years old.
brew install vim --with-lua -with-override-system-v

# Install more recent versions of some macOS tools.
brew install homebrew/dupes/grep
brew install homebrew/dupes/screen
brew install tree

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# get the latest version of git
brew install git

# the silver searcher, needed for ctl-p vim extension, grep replacement.
brew install ag

# install the latest version of node
brew install node

# install golang
brew install go

# install bzr, requried for installing some package dependencies
brew install bzr

# install docker components
brew install docker
brew install docker-machine
brew install docker-compose

# install hugo, used for managing static websites
brew install hugo

# aws command-line tools
brew install awscli

# youtube-dl tool
brew install youtube-dl

# reattach-to-user-namespace needed for tmux => macos clipboard sync
# https://www.devroom.io/2017/03/22/tmux-and-vim-copy-and-paste-on-macos-sierra/
brew install reattach-to-user-namespace

# quicklook plugins, make that spacebar work for you!
# see https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv qlimagesize webpquicklook suspicious-package quicklookase qlvideo

# Remove outdated versions from the cellar.
brew cleanup

