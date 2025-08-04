#!/bin/bash
sudo wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
sudo echo "deb https://packages.sury.org/php/ bullseye main" | sudo tee /etc/apt/sources.list.d/php.list

sudo apt update \
  && sudo apt install --no-install-recommends -y php8.3-fpm \
  && sudo apt install -y \
  php8.3-{bcmath,bz2,cli,common,curl,fpm,mbstring,mysql,redis,opcache,xdebug,xml,zip}

sudo update-alternatives --set php /usr/bin/php8.3 && \
sudo update-alternatives --set phar /usr/bin/phar8.3 && \
sudo update-alternatives --set phar.phar /usr/bin/phar.phar8.3
