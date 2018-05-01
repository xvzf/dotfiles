#!/bin/zsh

#
#	Dotfile installation script
#

# General dependencies
INSTALL_CANDIDATES="git curl"

# Dependencies for oh-my-zsh plugins, fuzzifind is a nice addition
ZSH_DEPENDENCY="zsh python autopep8 python-virtualenvwrapper virtualenvwrapper fzf"

# For now agnoster-light theme
THEME_URL="https://raw.githubusercontent.com/mkolosick/agnoster-light/master/agnoster-light.zsh-theme"
THEME_PATH="~/.oh-my-zsh/themes/agnoster-light.zsh-theme"



# =========================================================

INSTALL_CANDIDATES="${INSTALL_ANDIDATES} ${ZSH_DEPENDENCY}"

# =========================================================



# Installs oh my zsh and copies all configuration files
function install_zsh {
	echo " --> [+] Installing openzsh"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

	echo " --> [+] Copying zsh config"
	cat zshrc > ~/.zshrc

	echo " --> [+] Downloading agnoster-light theme"
	curl -o $THEME_PATH $THEME_URL

	echo " --> [+] oh-my-zsh installation complete"
}


# Installs dependencies, vundle and copies the configuration
function install_vim {
	echo " --> [+] Installing Vundle"
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
}



# =========================================================


echo "     ====================================================="
echo "     ==================  DOTFILE SETUP  =================="
echo "     ====================================================="
echo


echo "[+] Installing requirements, please enter sudo password"
sudo pacman _S $INSTALL_CANDIDATES

echo "[+] Installing ZSH configuration"
install_zsh

echo "[+] Installing VIM configuration"
# install_vim
