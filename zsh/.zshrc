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

export VISUAL=vim
export TERM="xterm-256color"

export GOROOT=/usr/local/opt/go/libexec


export PATH="${PATH}:$HOME/bin/:$HOME/go/bin/:$HOME/.cargo/bin/"

# =============
#   Plugins
# =============
# Include dircolors
# test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)

source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/keybindings.sh
source ~/.secrets

# Autocompletions
source ~/.zsh/plugins/kubectl_lazyload.sh
source <(fly completion --shell zsh)
source <(stern --completion=zsh)
case `uname` in
  Darwin)
    source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
    source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
    [[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null
    source /usr/local/opt/fzf/shell/key-bindings.zsh
    ;;
esac


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

alias python=python3 # Just to be safe

# If we are on macos, provide a shortcut to open google chrome
google-chrome() {
  open -a "Google Chrome" "$1"
}

# =============
#   Custom Shortcuts
# =============

theme-switch () {
  echo -e "\033]50;SetProfile=$1\a"
  export ITERM_PROFILE=$1
  case $1 in
    dark)
      export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#555555"
    ;;
    light)
      export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#aaaaaa"
    ;;
  esac
}
if [[ "$(date +%H:%M)" > "07:00" ]] || [[ "$(date +%H:%M)" < "20:00" ]]; then
  theme-switch dark
else
  theme-switch dark
fi

alias tf=terraform

# Kubernetes related
alias k=kubectl
kcc(){kubectl config use-context $(kubectl config get-contexts -o name | fzf --reverse)}
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
kdbg(){kubectl run --generator=run-pod/v1 tmp-net-debug-shell --rm -i --tty --image nicolaka/netshoot -- /bin/bash}

# Git related
gco(){git checkout $@}
gf(){git fetch $@}
gm(){git merge $@}
gp(){git push $@}

# Concourse
f(){fly -t $CONCOURSE_TARGET $@}

# Gcloud
gc(){gcloud $@}
gcj(){gcloud $@ --format="json"}
gcc(){gcloud config project set $(gcloud projects list --format="json" | jq '.[].name' -r | fzf --reverse)}

# =============
#   Functions
# =============

__cd_ls() { cd $1; ls; }
alias cd=__cd_ls
__bat() { bat --theme=OneHalfDark $@; }
alias cat=__bat

export EDITOR=nvim


# Prompt
eval "$(starship init zsh)"

# gcloud beta deployment-manager types describe projects.instances.appProfiles --provider="bigtableadmin-v2" --project="gcp-types"
