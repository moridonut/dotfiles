#!/bin/bash
mkdir ~/Documents
mkdir ~/Documents/vimfiles
mkdir ~/Documents/vimfiles/tmp

rm -fR ~/.vim*
ln -s ~/dotfiles/vimfiles ~/.vim
ln -s ~/dotfiles/_vimrc ~/.vimrc

