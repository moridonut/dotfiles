#!/bin/bash
mkdir ~/Documents
mkdir ~/Documents/vimfiles
mkdir ~/Documents/vimfiles/tmp

rm -fR ~/.vim*
ln -s ~/dotfiles/vimfiles ~/.vim
ln -s ~/dotfiles/_vimrc ~/.vimrc


mkdir ~/.ssh
echo ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC0LipR7SOFbD4Gn4/+9QEWjjPFMASBwTc05OVLxCbGrGik/fCXRrByvYDaKrnn7rup1Ve1cehIyo/5+hAWIEuW9AII3nOL+qsQTO6l6xXCB15e0lBUAKzaW4LoNkScasbEAZNYId4jbG36ivOqG+qyI6mE+4DpVhH0/lzRU1rC8n5F8Lxui8LPU1CVbJZuZPPY6ZOuU/FTCIc6NxxSviUfMWkT5kt8OWI49nLxjYJZOF2hbBi9TAI2jD8mOgPhLn8+lLF8EueO+nF7gYc02vNdlHHz2efzw/h/Sn3P0CwLR1GKCcmq+7fcdQh0MAV2vzolLP4F8PE2cFZsL924dNpt takmor@TAKMOR-820 >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys

