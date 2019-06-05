#############################################################################
#                                                                           #
# This file loads all my generic shell stuff.                               #
#                                                                           #
# @package    dotfiles/zsh                                                  #
# @filename   .zshenv                                                       #
# @author     Amir Heinisch <mail@amir-heinisch.de>                         #
# @link       https://amir-heinisch.de                                      #
# @version    1.0 (14/05/2019)                                              #
#                                                                           #
#############################################################################

# Load all generic stuff from ${HOME}/.config/shell/generic.
if [ -f "${HOME}/.config/shell/generic" ]
then
    source "${HOME}/.config/shell/generic"
fi
