#!/bin/sh -ex

echo "source ~/dotfiles/zsh/zshrc.sh" > ~/.zshrc

echo "source ~/dotfiles/vim/vimrc" > ~/.vimrc

ln -sf ~/dotfiles/tmux/tmux.conf ~/.tmux.conf

