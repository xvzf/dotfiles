#!/bin/zsh

#
#    Dotfile installation script
#


# For now agnoster-light theme
THEME_URL="https://raw.githubusercontent.com/mkolosick/agnoster-light/master/agnoster-light.zsh-theme"
THEME_PATH="${HOME}/.oh-my-zsh/themes/agnoster-light.zsh-theme"



# =========================================================



# Installs oh my zsh and copies all configuration files
function install_zsh {
    echo " --> [+] Installing openzsh"
    wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh
    sed -i.tmp 's:env zsh::g' install.sh
    sed -i.tmp 's:chsh -s .*$::g' install.sh
    sh install.sh
    rm install.sh

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

    echo " --> [+] Copying vim config"
    cat vimrc > ~/.vimrc

    echo " --> [+] Installing vim plugins"
    vim +PluginInstall +qall
}



# =========================================================


echo "     ====================================================="
echo "     ==================  DOTFILE SETUP  =================="
echo "     ====================================================="
echo


echo "[+] Installing requirements, please enter sudo password"
sudo pacman -S git curl wget zsh python autopep8 python-virtualenvwrapper fzf

echo "[+] Installing ZSH configuration"
install_zsh

echo "[+] Installing VIM configuration"
install_vim
