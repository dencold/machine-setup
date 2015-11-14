#!/usr/bin/env bash
# ---------------------------------------------------------------------------------------
# Many of the system-wide settings for OSX can be modified via the `defaults` utility. 
# Apple has developed this as a way to modify preferences via the command-line. This
# script contains many of those configuration settings that I prefer. This setup file
# should just be run once and can take a fresh installation and modify it into the 
# desired behavior. Gone are the days of tweaking things via the System Preferences 
# GUI!
#
# Special thanks to @mathias for a lot of prior art here
#
# Author: Dennis Coldwell (@dencold)
#

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Reveal IP address, hostname, OS version, etc. when clicking the clock
# in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

