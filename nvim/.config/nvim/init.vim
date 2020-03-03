if &compatible
  set nocompatible
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

source ~/.config/nvim/plugins.vim

filetype plugin indent on
syntax enable
if !has('nvim')
  set encoding=UTF-8
  set wildmenu
endif

source ~/.config/nvim/settings.vim
source ~/.config/nvim/buffer_settings.vim
source ~/.config/nvim/neoclide_settings.vim
source ~/.config/nvim/go_settings.vim
source ~/.config/nvim/appearance.vim
source ~/.config/nvim/shortcuts.vim
