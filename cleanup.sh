sudo apt autoremove --purge
sudo apt autoclean
sudo apt clean
sudo rm -rf /var/cache/* /var/tmp/* /tmp/*
sudo journalctl --vacuum-time=1d
