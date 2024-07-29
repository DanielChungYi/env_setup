#!/bin/bash

# Some useful tools
sudo update && sudo upgrade
sudo apt install terminator tmux vim mc


# Vim setup
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp .vimrc ~/.vimrc
