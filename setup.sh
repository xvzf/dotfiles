#!/bin/sh -ex

### Managed configs
CONFIGS="zsh git tmux vim nvim fzf"

### Neoclide Plugins
COC_PLUGINS="coc-go"

### MacOS Packages
BREW_PACKAGES="fzf neovim jq ripgrep bat exa zsh git go tmux stow python3 node k3d mas php composer packer terraform starship stern"
BREW_CASK_PACKAGES="docker google-chrome visual-studio-code slack jira-client google-cloud-sdk drawio"


# ======================
# Magic
# ======================

# Install packages
case `uname` in
  # MAC specific commands
  Darwin)
    brew install $BREW_PACKAGES
    brew cask install $BREW_CASK_PACKAGES
    ;;
esac

# Symlink build files
for CONFIG in $CONFIGS; do
	echo "[+] Copying config files for ${CONFIG} ..."
  stow --dir=$(pwd) --target=$HOME $CONFIG
done

# Auto install nvim packages & coc extensions
nvim --headless -c ":call dein#install() | :call dein#check_install() | q"
for COC_PLUGIN in $COC_PLUGINS; do
  nvim --headless -c ":CocInstall ${COC_PLUGIN}" -c "q"
done
nvim -S --headless -c ":GoInstallBinaries" -c "q" || true
