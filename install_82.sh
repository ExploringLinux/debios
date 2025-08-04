#!/bin/bash

# Add the PHP repository from Sury
sudo wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
echo "deb https://packages.sury.org/php/ bullseye main" | sudo tee /etc/apt/sources.list.d/php.list

# Update package lists
sudo apt update

# Install PHP 8.2 and required extensions
sudo apt install --no-install-recommends -y php8.2-fpm \
  && sudo apt install -y \
  php8.2-{bcmath,bz2,cli,common,curl,fpm,mbstring,mysql,redis,opcache,xdebug,xml,zip}

# Set PHP 8.2 as the default version
sudo update-alternatives --set php /usr/bin/php8.2
sudo update-alternatives --set phar /usr/bin/phar8.2
sudo update-alternatives --set phar.phar /usr/bin/phar.phar8.2
