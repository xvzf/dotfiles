#!/bin/sh -ex

### Managed configs
CONFIGS=""

### MacOS Packages
BREW_PACKAGES="fzf neovim jq yq ripgrep bat exa zsh git go tmux python3 node k3d mas php composer packer terraform starship stern aquasecurity/trivy/trivy"
BREW_CASK_PACKAGES="docker google-chrome visual-studio-code slack google-cloud-sdk drawio"


# ======================
# Magic
# ======================

# Install packages
case `uname` in
  # MAC specific commands
  Darwin)
    brew install $BREW_PACKAGES
    brew install --cask $BREW_CASK_PACKAGES
    ;;
esac
