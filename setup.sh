#!/bin/sh -ex

CONFIGS="zsh git"

BREW_PACKAGES="fzf nvim ripgrep exa zsh git go tmux stow"
BREW_CASK_PACKAGES="docker google-chrome visual-studio-code"

# Install packages
case `uname` in
  # MAC specific commands
  Darwin)
    brew install $BREW_PACKAGES
    brew cask install $BREW_CASK_PACKAGES
    ;;
  Linux)
    ;;
esac

# Symlink build files
for CONFIG in $CONFIGS; do
	echo "[+] Copying config files for ${CONFIG} ..."
	stow $CONFIG
done
