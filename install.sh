#!/bin/bash

echo "Install junegunn/vim-plug"

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &&
  nvim "+PlugInstall" +qall &&
  nvim "+echo 'Done!'"
