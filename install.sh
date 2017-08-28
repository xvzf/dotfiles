#!/bin/bash

#i3
mkdir ~/.config
cp -R ./i3 ~/.config/

#neovim
mkdir ~/.config
cp -R ./neovim ~/.config/neovim

#zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cat zshrc > ~/.zshrc

#Xresources
cp Xresources ~/.Xresources
cp -R Xresources.d ~/.Xresources.d
