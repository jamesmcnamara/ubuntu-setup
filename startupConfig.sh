#! /bin/bash

# Installation script for automatically configuring a computer following fresh installation of Ubuntu
# Sam Rendall - sdrendall@gmail.com
# James McNamara

# Repos ect
sudo add-apt-repository ppa:webupd8team/sublime-text-2 -y # sublime
sudo apt-add-repository ppa:ehoover/compholio -y # netflix

sudo apt-get update -y && apt-get upgrade -y

# Install some useful programs
sudo apt-get install terminator openssh-server nmap vim git nautilus-open-terminal -y

# Install Sublime
sudo apt-get install sublime-text -y 

# Install Spotify
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59 && sudo sh -c 'echo "deb http://repository.spotify.com stable non-free" >> /etc/apt/sources.list' && sudo apt-get update && sudo apt-get install spotify-client -y

#Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && sudo dpkg -i google-chrome*; sudo apt-get -f install -y

#Netflix
sudo apt-get install netflix-desktop -y

#Dropbox
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf - && ~/.dropbox-dist/dropboxd

#Samba (for File Sharing)
sudo apt-get install  samba samba-common python-glade2 system-config-samba -y
#TODO: Samba still requires configuring

#Move keybinds
./moveKeyBinds

#Update terminator config file
./termConfigMvr

# reboot
sudo reboot
