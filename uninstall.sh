#!/bin/bash
# coding: utf-8

# sudo chmod +x uninstall.sh
# sudo ./uninstall.sh
# list of installed packages (with their size) sorted by size:
# dpkg-query -Wf '${Installed-Size}\t${Package}\n' | sort -nr | more

# dpkg-query -Wf '${Installed-Size}\t${Package}\t${Priority}\n' | egrep '\s(optional|extra)' | cut -f 1,2 | sort -nr | less
# This will exclude high-priority packages (required, important or standard) and list only optional and extra packages.

#Delete GCC
#dpkg --get-selections | grep gcc \-
# sudo aptitude purge -y gcc-4.6-base:armhf gcc-4.7-base:armhf gcc-4.8-base:armhf gcc-4.9-base:armhf gcc-5-base:armhf

sudo apt-get remove --purge --autoremove -y bluej
sudo apt-get remove --purge --autoremove -y dillo
sudo apt-get remove --purge --autoremove -y epiphany*
sudo apt-get remove --purge --autoremove -y greenfoot
sudo apt-get remove --purge --autoremove -y libreoffice*
sudo apt-get remove --purge --autoremove -y minecraft-pi
sudo apt-get remove --purge --autoremove -y netsurf-gtk
sudo apt-get remove --purge --autoremove -y scratch
sudo apt-get remove --purge --autoremove -y scratch2
sudo apt-get remove --purge --autoremove -y sonic-pi
sudo apt-get remove --purge --autoremove -y wolfram*
sudo apt-get remove --purge --autoremove -y nodered
sudo apt-get remove --purge --autoremove -y sense-hat
sudo apt-get remove --purge --autoremove -y python-sense-emu 
sudo apt-get remove --purge --autoremove -y python3-sense-emu 
sudo apt-get remove --purge --autoremove -y sense-emu-tools
sudo apt-get remove --purge --autoremove -y smartsim
sudo apt-get remove --purge --autoremove -y python3-thonny
sudo apt-get remove --purge --autoremove -y claws-mail
sudo apt-get remove --purge --autoremove -y python-pygame
sudo apt-get remove --purge --autoremove -y python3-pygame
sudo apt-get remove --purge --autoremove -y python-games
sudo apt-get remove --purge --autoremove -y realvnc-vnc-viewer
sudo apt-get remove --purge --autoremove -y nuscratch
sudo apt-get remove --purge --autoremove -y pypy
sudo apt-get remove --purge --autoremove -y pypy-lib
sudo apt-get remove --purge --autoremove -y oracle-java8-jdk
sudo apt-get remove --purge --autoremove -y vim-tiny
sudo apt-get remove --purge --autoremove -y vim-common


sudo rm /usr/share/raspi-ui-overrides/applications/python-games.desktop
sudo rm /usr/share/raspi-ui-overrides/applications/bluej.desktop
sudo rm /usr/share/raspi-ui-overrides/applications/geany.desktop
sudo rm /usr/share/raspi-ui-overrides/applications/greenfoot.desktop
sudo rm /usr/share/raspi-ui-overrides/applications/libreoffice*.desktop
sudo rm /usr/share/raspi-ui-overrides/applications/minecraft-pi.desktop
sudo rm /usr/share/raspi-ui-overrides/applications/scratch.desktop
sudo rm /usr/share/raspi-ui-overrides/applications/wolfram*.desktop

sudo apt-get clean -y
sudo apt-get autoremove -y
