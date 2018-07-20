" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" let Vundle manage Vundle, required
Plug 'VundleVim/Vundle.vim'

Plug 'icymind/NeoSolarized'
Plug 'xvzf/ayu-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'Yggdroot/indentLine'
Plug 'vim-python/python-syntax'
Plug 'itchyny/lightline.vim'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-fugitive'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh', }
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'roxma/nvim-yarp'
" Plug 'ncm2/ncm2-ultisnips'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

" Initialize plugin system
call plug#end()
