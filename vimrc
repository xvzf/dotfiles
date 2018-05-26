set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree.git'
Plugin 'python-mode/python-mode'
Plugin 'tpope/vim-surround'
Plugin 'marcweber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'tomtom/tcomment_vim'
Plugin 'junegunn/fzf.vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" ========================================================
" Color theme configuration
syntax enable
silent! colorscheme solarized
set background=light


" ========================================================
" NerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" ========================================================
" Python Plugins
let g:pymode_python = 'python3'
let g:pymode_rope = 1
let g:pymode_rope_autoimport = 1
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 1
set completeopt=menu,noinsert " default is menu,preview. Don't insert text until selection is made


" ========================================================
" Custom functions
" Restore last position in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"zz" | endif
endif


" ========================================================
" Default configuration
syntax on
set number
set wildmenu
set list
set listchars=tab:•\ ,trail:•,extends:»,precedes:«
set mouse=a
set relativenumber number

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Python specific
au BufNewFile,BufRead *.py set
    \ tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ shiftround
    \ expandtab
    \ foldmethod=indent
    \ colorcolumn=80
    \ foldlevel=99
    \ autoindent
au BufNewFile *.py set
    \ fileformat=unix
au BufWritePre *.py
    \ %s/\s\+$//e

" HTML/JS specific
au BufNewFile,BufRead *.js, *.html, *.css set
    \ tabstop=2
    \ softtabstop=2
    \ shiftwidth=2

" Search specific
set hlsearch
set incsearch
set ignorecase
set smartcase


" ========================================================
" Shortcuts

" Set <Leader>
let mapleader=","

" Split navigation
map <Leader>v <esc>:vsplit<CR>
map <Leader>s <esc>:split<CR>
map <Leader>d <esc>:close<CR>
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l

" Tab navigation
map <Leader>c <esc>:tabnew<CR>
map <Leader>l <esc>:tabnext<CR>
map <Leader>h <esc>:tabprevious<CR>

" Files
map <Leader>f <esc>:FZF<CR>
map <c-s> <esc>:w<CR>

" Makes code block ident so much easier
vnoremap < <gv
vnoremap > >gv

" Folding
nnoremap <space> za
map <Leader>fa zM
map <Leader>fu zR

" Plugin shortcuts
map <C-b> :NERDTreeToggle<CR>

" Search shortcuts
map <Leader>q <esc>:noh<CR>

" === Python shortcuts
" File header
map <Leader>ph <esc>ggimodh<TAB>

" === RST Shortcuts
" Header
map <Leader>rh yyppVr=2kVr=
" Subline
map <Leader>rs yypVr~

