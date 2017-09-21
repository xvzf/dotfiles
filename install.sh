#!/bin/bash

#neovim
mkdir ~/.config
cp -R ./neovim ~/.config/neovim

#zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cat zshrc > ~/.zshrc
