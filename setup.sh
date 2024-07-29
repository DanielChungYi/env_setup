#!/bin/bash

# Some useful tools
sudo update && sudo upgrade
sudo apt install terminator tmux vim mc tig

# Vim setup
# See more command on https://github.com/junegunn/vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp .vimrc ~/.vimrc
