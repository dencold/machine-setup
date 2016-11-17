#!/usr/bin/env bash
# ---------------------------------------------------------------------------------------
# Installation script for my linux machines. I prefer the Arch distro, so this is uses
# pacman/yaourt to install packages. 
#
# author: @dencold
#


# Warning message & prompt for users
echo 
echo "************************ WARNING - MACHINE SETUP *************************** "
echo 
echo "   Running this script will install initial packages on this host. "
echo "   It will run pacman -Syu as an initial step to update all packages and "
echo "   repositories. Make sure you are okay with this. "
echo ""
echo "************************* YOU HAVE BEEN WARNED! :) ************************** "
echo 
read -p "Are you SURE? (y/N) ==> " SURE

if [[ "$SURE" != "Y" && "$SURE" != "y" ]];
then
    echo "Aborting machine setup."
    exit 0
fi

#-----------------------------------------------------------------------------------
# Directory Initialization
# - sets up our required directories
#-----------------------------------------------------------------------------------
echo "- Creating initial directories"
mkdir -p $HOME/src $HOME/bin $HOME/tmp

#-----------------------------------------------------------------------------------
# Install scripts
# - executes the individual installation scripts
#-----------------------------------------------------------------------------------
echo "- Installing Arch Core"
./arch-install-core.sh

echo "- Installing Arch AUR Packages"
./arch-install-aur.sh

echo "- Installing Applications"
./arch-install-apps.sh

echo
echo "!! FINISHED - machine setup!!"
echo "- You might want to run your dotfiles setup now."
echo