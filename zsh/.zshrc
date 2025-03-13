#!/usr/bin/env zsh

export PATH="$HOME/bin/:$HOME/go/bin/:$HOME/.cargo/bin/:$PATH"
# On MacOS, use homebrew binaries
if [[ "$(uname)" == "Darwin" ]]; then
  export PATH="$(brew --prefix)/bin:$PATH"
  export PATH="$(brew --prefix)/opt/gnu-getopt/bin:$PATH"
fi


mkdir -p "$HOME/.zsh"

# Install grml-zsh-config on first boot
if [[ ! -f "$HOME/.zsh/grml.zsh" ]]; then
	curl -L https://grml.org/console/zshrc > "$HOME/.zsh/grml.zsh"
fi

# Install antigen on first boot
if [[ ! -f "$HOME/.zsh/antigen.zsh" ]]; then
	curl -L git.io/antigen > "$HOME/.zsh/antigen.zsh"
fi

# Install FZF completion on first boot
if [[ ! -f "$HOME/.zsh/fzf_completion.zsh" ]]; then
	curl -L "https://raw.githubusercontent.com/junegunn/fzf/refs/tags/v0.60.3/shell/completion.zsh" > "$HOME/.zsh/fzf_completion.zsh"
fi

# Install FZF key_bindings on first boot
if [[ ! -f "$HOME/.zsh/fzf_key_bindings.zsh" ]]; then
	curl -L "https://raw.githubusercontent.com/junegunn/fzf/refs/tags/v0.60.3/shell/key-bindings.zsh" > "$HOME/.zsh/fzf_key_bindings.zsh"
fi


# Antigen plugins
source "$HOME/.zsh/antigen.zsh"
antigen bundle zsh-users/zsh-syntax-highlighting > /dev/null
antigen bundle zsh-users/zsh-completions > /dev/null
antigen bundle zsh-users/zsh-autosuggestions > /dev/null
antigen apply > /dev/null

# Misc
source "$HOME/.zsh/grml.zsh"
export FZF_DEFAULT_OPTS="--color query:regular,hl:#E6A64C,hl+:bold:#E6A64C,prompt:#E0A8E1,bg+:#561E57,gutter:-1,info:#565B8F,separator:#262840,scrollbar:#565B8F"
source "$HOME/.zsh/fzf_completion.zsh"
source "$HOME/.zsh/fzf_key_bindings.zsh"

# Navigation
__cd_ls() { cd $1; ls --color=auto; }
alias cd=__cd_ls

function __one_dir_up() {
  BUFFER="cd .."
  zle accept-line
}
zle -N __one_dir_up
bindkey "^k" __one_dir_up

# Autocompletion with strg+space
bindkey '^ ' autosuggest-accept

# Aliases
alias tf=terraform
alias v=nvim
alias g=git

# Kubernetes
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
kgks () {
	kubectl get kustomization $@ -o custom-columns=namespace:.metadata.namespace,name:.metadata.name,suspend:.spec.suspend,status:".status.conditions[0].status",reason:".status.conditions[0].reason",message:".status.conditions[0].message"
}
kgoom() {
  kubectl get pods "$@" --output=jsonpath='{ range .items[*] }{.metadata.namespace}    {.metadata.name}    {.status.containerStatuses[*].name}    {.status.containerStatuses[*].lastState.terminated.reason }    {.status.containerStatuses[*].lastState.terminated.finishedAt}{"\n"}{end}' | grep OOMKilled
}
klogs() {
  set -o pipefail
  PODS=$(kubectl get pods "$@" --field-selector status.phase=Running -o=jsonpath='{ range .items[*] }{.metadata.name} {.spec.containers[*].name}{"\n"}{ end }' --no-headers)

  if [[ -z $PODS ]]; then
    echo "No pods found in this namespace"
    exit 1
  fi

  allContainers=""
  while read -r line; do
    pod=$(echo "$line" | grep -Eo "^[A-Za-z0-9-]+")
    newContainers=$(echo "$line" | sed "s/$pod //" | gsed -E "s/([A-Za-z0-9-]+) ?/$pod --container=&\\n/g" | sed "/^$/d")
    allContainers="$allContainers$newContainers"$'\n'
  done <<< "$PODS"

  echo "$allContainers" | fzf --prompt "choose pod/container > " --preview "echo {} | xargs kubectl logs $* --tail=50" --height=100% --preview-window=right:80% --layout=default --bind="enter:execute(echo {} | xargs kubectl logs $* | tspin)+abort"
}


# GPG utils
secret () {
        output=~/"${1}".$(date +%s).enc
        gpg --encrypt --armor --output ${output} -r me@xvzf.tech "${1}" && echo "${1} -> ${output}"
}
reveal () {
        output=$(echo "${1}" | rev | cut -c16- | rev)
        gpg --decrypt --output ${output} "${1}" && echo "${1} -> ${output}"
}


# Better SSH
function sssh ()
{
    while true; do
        command ssh -o ConnectTimeout=1 "$@";
        [ $? -ne 255 ] && break || sleep 0.5;
    done
}

