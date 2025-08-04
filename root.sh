#!/bin/bash

# Change Debian to SID Branch
cp /etc/apt/sources.list /etc/apt/sources.list.bak
cp sources.list /etc/apt/sources.list

# Add Custom Titus Rofi Deb Package
#dpkg -i 'Custom Packages/rofi_1.7.0-1_amd64.deb'

# Update packages list
apt update -y

# Add base packages
#apt install zip unzip picom bspwm polybar sddm rofi kitty terminator firefox thunar flameshot neofetch sxhkd git lxpolkit lxappearance xorg

### important stuff for docker
apt install -y apt-transport-https ca-certificates chromium curl firefox-esr git gnupg gnupg2 lsb-release neofetch sddm software-properties-common spice-vdagent terminator unzip zip

apt install -y wget unzip

# apt-get install -y \
# g++ \
# libbz2-dev \
# libc-client-dev \
# libcurl4-gnutls-dev \
# libedit-dev \
# libfreetype6-dev \
# libicu-dev \
# libjpeg62-turbo-dev \
# libkrb5-dev \
# libldap2-dev \
# libldb-dev \
# libmagickwand-dev \
# libmcrypt-dev \
# libmemcached-dev \
# libpng-dev \
# libpq-dev \
# libsqlite3-dev \
# libssl-dev \
# libreadline-dev \
# libxslt1-dev \
# libzip-dev \
# zlib1g-dev

#### So this is a minimal, minimal install of kde.
apt install -y --no-install-recommends kde-plasma-desktop plasma-nm

### need a window manager
apt install -y kwin-x11

### need system settings and display settings
apt install -y systemsettings xsettingsd kscreen

### do some config with SDDM in Kde Settings
apt install -y kde-config-sddm kde-config-gtk-style kde-config-screenlocker

apt install -y qt5-style-kvantum qt5-style-kvantum-themes

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  bullseye stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io
usermod -aG docker $USER
curl -L https://github.com/docker/compose/releases/download/v2.4.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
#bspwm
#firefox-esr
#flameshot
#git yyyyy
#kitty xxxx
#lxappearance xxx
#lxpolkit
#neofetch yyyy
#picom
#polybar
#rofi
#sddm
#sxhkd
#terminator yyy
#thunar
#unzip yyyy
#xorg
#zip yyy
#git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
#git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Download Nordic Theme

### install php 8.1
wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
echo "deb https://packages.sury.org/php/ bullseye main" | sudo tee /etc/apt/sources.list.d/php.list
wget http://ftp.us.debian.org/debian/pool/main/libf/libffi/libffi7_3.3-6_amd64.deb
dpkg -i libffi7_3.3-6_amd64.deb
apt-get update
apt install -y php8.1
apt-get install -y php8.1-{cli,json,imap,bcmath,bz2,intl,gd,mbstring,mysql,zip}
apt install php8.1-fpm

systemctl disable --now apache2
apt remove --purge -y apache*
###### Remove Apache directory! rm -Rf /var/lib/apache2

sudo systemctl disable docker.service
sudo systemctl disable docker.socket
#sudo systemctl disable docker.service docker.socket

apt-get autoremove --purge -y && apt-get autoclean -y && apt-get clean -y

## Update alternatives after installing php 8.1
update-alternatives --set php /usr/bin/php8.1 && \
update-alternatives --set phar /usr/bin/phar8.1 && \
update-alternatives --set phar.phar /usr/bin/phar.phar8.1

#cd /usr/share/themes/
#git clone https://github.com/EliverLara/Nordic.git
apt install -y \
install net-tools \
openvpn \
meld --fix-missing \
htop;

touch /etc/openvpn/credentials
printf '%s\n' 'username' 'password' > /etc/openvpn/credentials

apt-get install -y zsh

## Cleanup
apt-get autoremove --purge -y && apt-get autoclean -y && apt-get clean -y \
rm -rf /var/lib/apt/lists/* && \
rm -rf /tmp/* /var/tmp/*
