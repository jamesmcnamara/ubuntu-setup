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

# Install Spotify
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4E9CFF4E && sudo sh -c 'echo "deb http://repository.spotify.com stable non-free" >> /etc/apt/sources.list' && sudo apt-get update && sudo apt-get install spotify-client -y --force-yes

#Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && sudo dpkg -i google-chrome*; sudo apt-get -f install --force-yes -y

#Netflix
sudo apt-get install netflix-desktop -y

#Dropbox(64-bit)
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf - && ~/.dropbox-dist/dropboxd

########################## CODE AND TEXT EDITORS ##########################
#Java (32-bit)
wget http://download.oracle.com/otn-pub/java/jdk/8-b132/jdk-8-linux-i586.tar.gz &&
    tar -zxf jdk-8-linux-i586.tar.gz && sudo mv jdk1.8.0 /usr/local/java &&
    sudo echo -e "export JAVA_HOME=/usr/local/java/ \nexport PATH=$PATH:$HOME/bin:$JAVA_HOME/bin \nexport JRE_HOME=/usr/local/java/jre \nexport PATH=$PATH:$HOME/bin:$JRE_HOME/bin" >> ~/.bashrc && 
    sudo update-alternatives --install "/usr/bin/java" "java" "/usr/local/java/jre/bin/java" 1 &&
    sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/local/java/bin/javac" 1 &&
    sudo update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/local/java/bin/javaws" 1 &&
    sudo update-alternatives --set java /usr/local/java/jre/bin/java && 
    sudo update-alternatives --set javac usr/local/java/bin/java &&
    sudo update-alternatives --set javaws usr/local/java/bin/javaws

#Go (I'm just saying, it takes that many lines to pull down java, and one command to install go)
sudo apt-get install golang -y


#Pip
sudo apt-get install python-pip -y

#Python files
sudo pip install -r ./requirements.pip

#Sublime
sudo apt-get install sublime-text

#Samba (for File Sharing)
sudo apt-get install  samba samba-common python-glade2 system-config-samba -y
#TODO: Samba still requires configuring

#Wallpaypa Changa'
sudo apt-get install wallch -y

#Move keybinds
./moveKeyBinds

#Update terminator config file
./termConfigMvr

# reboot
sudo reboot
