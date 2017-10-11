#!/bin/bash

#neovim
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > /tmp/install.sh
sh /tmp/install.sh

mkdir ~/.config
cp -R ./neovim ~/.config/neovim

#zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cat zshrc > ~/.zshrc
