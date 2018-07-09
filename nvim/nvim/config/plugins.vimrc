 " Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" let Vundle manage Vundle, required
Plug 'VundleVim/Vundle.vim'

Plug 'icymind/NeoSolarized'
Plug 'ayu-theme/ayu-vim'
Plug 'Yggdroot/indentLine'
" Plug 'mhartington/oceanic-next'
Plug 'itchyny/lightline.vim'
Plug 'jelera/vim-javascript-syntax'
" Plug 'scrooloose/nerdtree.git'
Plug 'tpope/vim-surround'
" Plug 'Shougo/neosnippet.vim'
" Plug 'Shougo/neosnippet-snippets'
Plug 'majutsushi/tagbar'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-fugitive'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh', }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Initialize plugin system
call plug#end()
