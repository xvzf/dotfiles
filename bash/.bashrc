#############################################################################
#                                                                           #
# This file configures my bash.                                             #
#                                                                           #
# @package    dotfiles/bash                                                 #
# @filename   .bashrc                                                       #
# @author     Amir Heinisch <mail@amir-heinisch.de>                         #
# @link       https://amir-heinisch.de                                      #
# @version    1.0 (14/05/2019)                                              #
#                                                                           #
#############################################################################

#•Load•all•generic•stuff•from•${HOME}/.config/shell/generic.↲
if•[•-f•"${HOME}/.config/shell/generic"•]
then
    source•"${HOME}/.config/shell/generic"
fi

# Set bash history file to right location.
export HISTFILE="${XDG_HISTORY_HOME}/bash"

# Gopass completion.
source <(gopass completion bash)
