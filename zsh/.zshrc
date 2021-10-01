autoload -Uz compinit
compinit

#=============
#   CONSTANTS
# =============
#

export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

HISTFILE=~/.zsh_history
SAVEHIST=2000
setopt inc_append_history # Save before execution
setopt share_history # Same history for every instance
unset command_not_found_handle # Fedora fix :-)


# =============
#   Settings
# =============

export VISUAL=nvim
export EDITOR="nvim"
export TERM="xterm-256color"
export COLORTERM="truecolor"

export GOROOT=/usr/local/opt/go/libexec


export PATH="${PATH}:$HOME/bin/:$HOME/go/bin/:$HOME/.cargo/bin/"

# =============
#   Plugins
# =============
# Include dircolors
# test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)

source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.secrets

# Autocompletions
source ~/.zsh/plugins/kubectl_lazyload.sh
source <(stern --completion=zsh)

# =============
#   Alias
# =============
if which exa &> /dev/null; then
  alias ls=exa
fi

if which nvim &> /dev/null; then
  alias v=nvim
else
  alias v=vim
fi


# =============
#   Custom Shortcuts
# =============

www() {
  open -a "Google Chrome" "$1"
}

# theme-switch () {
#  echo -e "\033]50;SetProfile=$1\a"
#  export ITERM_PROFILE=$1
#  case $1 in
#    dark)
#      export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#555555"
#    ;;
#    light)
#      export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#aaaaaa"
#    ;;
#  esac
#}
#if [[ "$(date +%H:%M)" > "07:00" ]] || [[ "$(date +%H:%M)" < "20:00" ]]; then
#  theme-switch dark
#else
#  theme-switch dark
#fi

alias tf=terraform
alias g=git

# Kubernetes related
alias k=kubectl
kcc(){kubectl config use-context $(kubectl config get-contexts -o name | fzf --reverse --height 40%) && tmux refresh-client -S}
ka(){kubectl apply $@}
kd(){kubectl delete $@}
kg(){kubectl get $@}
kgp(){kubectl get pods -o wide $@}
kga(){kubectl get all $@}
kgi(){kubectl get ingress $@}
kgs(){kubectl get services $@}
kgg(){kubectl get Gatewayss $@}
kgdr(){kubectl get DestinationRule $@}
kgvs(){kubectl get VirtualService $@}
kgns(){kubectl get namespaces $@}
kgss(){kubectl get secrets $@}
kgcm(){kubectl get cm $@}
kdbg(){kubectl run tmp-net-debug-shell -it --rm --image nicolaka/netshoot -- /bin/bash}

# =============
#   Functions
# =============
__cd_ls() { cd $1; ls; }
alias cd=__cd_ls

# =============
#   Keybindings
# =============
# go up one time
function __one_dir_up() {
  BUFFER="cd .."
  zle accept-line
}
zle -N __one_dir_up
bindkey "^k" __one_dir_up

# Autocompletion with strg+space
bindkey '^ ' autosuggest-accept

# Prompt
eval "$(starship init zsh)"
