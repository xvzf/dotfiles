# go up one time
function __one_dir_up() {
  BUFFER="cd .."
  zle accept-line
}
zle -N __one_dir_up
bindkey "^k" __one_dir_up

# Edit and rerun
function __edit_in_vim_and_rerun() {
  BUFFER="fc"
  zle accept-line
}
zle -N __edit_in_vim_and_rerun
bindkey "^e" __edit_in_vim_and_rerun

# Add Sudo
function __add_sudo() {
  BUFFER="sudo "$BUFFER
  zle end-of-line
}
zle -N __add_sudo
bindkey "^s" __add_sudo

# Autocompletion with strg+space
bindkey '^ ' autosuggest-accept
