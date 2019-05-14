#############################################################################
#                                                                           #
# This file contains my personal zsh configurations.                        #
#                                                                           #
# @package    dotfiles/zsh                                                  #
# @filename   .zshrc                                                        #
# @author     Amir Heinisch <mail@amir-heinisch.de>                         #
# @link       https://amir-heinisch.de                                      #
# @version    1.0 (14/05/2019)                                              #
#                                                                           #
#############################################################################

# {{{ # GENERAL #

# Do nothing for non-interactive shells. Everything important should be in zshenv.
# [[ -z "$PS1"]] && return

# TODO: Does this makes sense???
# TODO: Personal zsh should not completly depend on system configs...
# TODO: is /etc/zsh/zprofile called automatically? findout file call order
# source /etc/zsh/zprofile

# Set history options.
export HISTFILE="${XDG_HISTORY_HOME}/zsh"
SAVEHIST=1000
setopt share_history
setopt inc_append_history
unset command_not_found_handle # Fedora fix from mri...try out.

# {{{ ## OH-MY-ZSH OPTIONS ##

# brew does not allow root and runs unde user admin.
# zsh wants current user so disable zsh warning:
ZSH_DISABLE_COMPFIX=true

# Set theme.
# TODO: maybe make my own day and night themes?
ZSH_THEME="agnoster"

# Plugins.
plugins=(adb git docker)

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty.
DISABLE_UNTRACKED_FILES_DIRTY="true"

## }}}

# Load oh-my-zsh.
# TODO: maybe live without oh-my-zsh overhead?!
export ZSH="${XDG_CONFIG_HOME}/zsh/oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# Load plugins without oh-my-zsh.
source ${XDG_CONFIG_HOME}/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ${XDG_CONFIG_HOME}/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source ${XDG_CONFIG_HOME}/zsh/plugins/kubectl_lazyload.sh
# source ~/dotfiles/zsh/plugins/vi-mode.plugin.zsh

# Use zsh with vim style navigation.
bindkey -v
bindkey -M viins 'jk' vi-cmd-mode

# }}}
