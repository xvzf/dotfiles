#=============
#   CONSTANTS
# =============

HISTFILE=~/.zsh_history
SAVEHIST=2000
setopt inc_append_history # Save before execution
setopt share_history # Same history for every instance
unset command_not_found_handle # Fedora fix :-)


# =============
#   Settings
# =============

export ZSH_CUSTOM="${HOME}/dotfiles/zsh/plugins/custom-oh-my-zsh"
export ZSH="${HOME}/dotfiles/zsh/plugins/oh-my-zsh"
export VISUAL=vim
export TERM="xterm-256color"
export PATH="${PATH}:/home/$USER/go/bin/:/home/$USER/.cargo/bin/"

export ANSIBLE_HOST_KEY_CHECKING=False


# =============
#   Plugins
# =============

ZSH_THEME="xvzf"
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
  git
  docker
)

source $ZSH/oh-my-zsh.sh

# source ~/dotfiles/zsh/plugins/vi-mode.plugin.zsh
source ~/dotfiles/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/dotfiles/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/dotfiles/zsh/plugins/kubectl_lazyload.sh
source ~/dotfiles/zsh/keybindings.sh


# =============
#   Alias
# =============

alias v=vim # Easier to type
alias ls=exa # Use exa for better highlighting
alias python=python3 # Just to be safe


# =============
#   Functions
# =============

__cd_ls() {
  cd $1;
  ls
}
alias cd=__cd_ls
