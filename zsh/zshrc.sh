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

# Depending on MacOS and Linux, set a different gopath
case `uname` in
  Darwin)
    export GOROOT=/usr/local/opt/go/libexec
    ;;
  Linux)
    export GOROOT=/usr/local/go
    ;;
esac

export GOPATH=$HOME/go
export PATH="${PATH}:$HOME/bin/:$GOPATH/bin/:$HOME/.cargo/bin/:$GOROOT/bin:$HOME/.fzf/bin:$GOROOT/bin"

export ANSIBLE_HOST_KEY_CHECKING=False
export GOMODULES111=on
export GOPATH=$HOME/go


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
source ~/.secrets

[[ $- == *i* ]] && source "~/.fzf/shell/completion.zsh" 2> /dev/null
source ~/.fzf/shell/key-bindings.zsh


# =============
#   Alias
# =============

alias v=vim # Easier to type
alias kc=kubectl
if which exa &> /dev/null; then
  alias ls=exa # Use exa for better highlighting
fi
alias python=python3 # Just to be safe

# If we are on macos, provide a shortcut to open google chrome
google-chrome() {
  open -a "Google Chrome" "$1"
}

# =============
#   Custom Shortcuts
# =============

kga(){kubectl get all $@}
kgi(){kubectl get ingress $@}
kgs(){kubectl get secret $@}
kc_nettool(){kubectl run --generator=run-pod/v1 tmp-net-debug-shell --rm -i --tty --image nicolaka/netshoot -- /bin/bash}



# =============
#   Functions
# =============

__cd_ls() {
  cd $1;
  ls
}
alias cd=__cd_ls

