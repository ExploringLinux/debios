# Debian-titus
Debian customizations from Chris Titus Tech

## Requirements
_This install changes Debian to the SID (Dev) Branch_

### Download Debian non-free netinstall
Use the following Debian ISO as the base <https://cdimage.debian.org/cdimage/unofficial/non-free/cd-including-firmware/weekly-builds/amd64/iso-cd/>

*do NOT grab the EDU download and this includes non-free and firmware*

### font size bigger
`sudo dpkg-reconfigure console-setup`
Terminus-bold
Make it 10x20 (frame-buffer only)

### copy/paste to guest
`sudo apt install spice-vdagent`

### Base Stuff - Root

_Run as ROOT_
```
sudo su
./root.sh
```

### Theme Stuff - User Level
 ```
 ./user.sh
 ```
