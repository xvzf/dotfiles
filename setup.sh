#!/bin/sh -ex

TARGET_USER="xvzf"

### Managed configs
CONFIGS="zsh git tmux vim nvim fzf"

### Neoclide Plugins
COC_PLUGINS="coc-go"

### MacOS Packages
BREW_PACKAGES="fzf neovim jq ripgrep exa zsh git go tmux stow python3 node k3d mas"
BREW_CASK_PACKAGES="docker google-chrome visual-studio-code slack jira-client google-cloud-sdk drawio"

### Alpine Linux Packages
ALPINE_PACKAGES="fzf neovim jq exa zsh git go tmux stow openssh gcc python3-dev nodejs curl zsh npm"


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
  Linux)
    # WOHOOO WE ARE RUNNING IN A CONTAINER \o/
    if [[ -f /etc/alpine-release ]]; then
      apk add --no-cache $ALPINE_PACKAGES
      su $TARGET_USER
    fi
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
