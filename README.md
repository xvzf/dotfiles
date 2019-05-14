# Dotfiles
My personal configuration files.

## Setup

First you need to clone this repo and checkout all submodules:

```
    git clone https://github.com/amir-heinisch/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
    git submodule update --init
```

Then you can use the INSTALL script or tools like gnu stow to symlink your 
dotfiles to the correct locations:

```
    stow -d $HOME/dotfiles -t $HOME vim
```

You can also do it by hand if you want:

```
    ln -s "$HOME/.dotfiles/vim/.vimrc" $HOME/.vimrc
```
