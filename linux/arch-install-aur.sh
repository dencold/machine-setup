#!/usr/bin/env bash
# ---------------------------------------------------------------------------------------
# Installs packages from the Arch User Repository (AUR). These are packages that aren't
# maintained by the official distribution, but instead by the community.
#
# Author: @dencold
#

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# make sure that arch is fully updated
pacman --noconfirm -Syu

# we do all aur work (downloading PKGBUILD, tar extract, etc.) in the aur dir
AURDIR=$HOME/aur
mkdir -p $AURDIR; cd $AURDIR

# package-query -- required for yaourt
pkg=package-query
echo "- Installing $pkg"
curl -O https://aur.archlinux.org/cgit/aur.git/snapshot/$pkg.tar.gz
tar xzvf $pkg.tar.gz -C $AURDIR
cd $AURDIR/$pkg
makepkg -sri --noconfirm
cd $AURDIR
rm $pkg.tar.gz

# yaourt -- pacman/AUR pacakge installer
pkg=yaourt
echo "- Installing $pkg"
curl -O https://aur.archlinux.org/cgit/aur.git/snapshot/$pkg.tar.gz
tar xzvf $pkg.tar.gz -C $AURDIR
cd $AURDIR/$pkg
makepkg -sri --noconfirm
cd $AURDIR
rm $pkg.tar.gz
