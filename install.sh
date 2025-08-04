#!/bin/bash

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

username=$(id -u -n 1000)
builddir=$(pwd)

# Change Debian to SID Branch
#cp /etc/apt/sources.list /etc/apt/sources.list.bak
#cp sources.list /etc/apt/sources.list

# Update packages list and update system
apt update
#apt upgrade -y

# Making .config and Moving config files and background to Pictures
cd $builddir
mkdir -p /home/$username/.config
mkdir -p /home/$username/.fonts
mkdir -p /home/$username/Pictures
#mv user-dirs.dirs /home/$username/.config
chown -R $username:$username /home/$username

# Installing Essential Programs 
# Add base packages
sudo apt install -y zip unzip terminator wget git build-essential

### important stuff for docker
sudo apt install -y apt-transport-https ca-certificates curl gnupg gnupg2 lsb-release software-properties-common

# Installing Other less important Programs
sudo apt install -y neofetch flameshot papirus-icon-theme fonts-noto-color-emoji

# Download Nordic Theme
cd /usr/share/themes/
git clone https://github.com/EliverLara/Nordic.git

# Installing fonts
cd $builddir 
sudo apt install -y install fonts-font-awesome -y
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
unzip FiraCode.zip -d /home/$username/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip
unzip Meslo.zip -d /home/$username/.fonts
chown $username:$username /home/$username/.fonts/*

# Reloading Font
fc-cache -vf
# Removing zip Files
rm ./FiraCode.zip ./Meslo.zip

# Install Nordzy cursor
git clone https://github.com/alvatip/Nordzy-cursors
cd Nordzy-cursors
./install.sh
cd $builddir
rm -rf Nordzy-cursors

# Beautiful bash
#git clone https://github.com/ChrisTitusTech/mybash
#cd mybash
#bash setup.sh
#cd $builddir

# DWM Setup
#git clone https://github.com/ChrisTitusTech/dwm-titus
#cd dwm-titus
#make clean install
#cp dwm.desktop /usr/share/xsessions
#cd $builddir

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  bullseye stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null



sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER
sudo curl -L https://github.com/docker/compose/releases/download/v2.24.5/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose


# Yes, Zsh, yes
sudo apt-get install -y zsh

#touch /etc/openvpn/credentials
#printf '%s\n' 'username' 'password' > /etc/openvpn/credentials


## Cleanup
sudo apt-get autoremove --purge -y && sudo apt-get autoclean -y && sudo apt-get clean -y
sudo rm -rf /var/lib/apt/lists/*
sudo rm -rf /tmp/* /var/tmp/*
