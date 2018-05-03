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

" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'

Plugin 'junegunn/fzf.vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" ========================================================
" Color theme configuration
syntax enable
set background=light
silent! colorscheme solarized


" ========================================================
" Buggy.. Keeps crashing @INVESTIGATE
" Airline configuration
" let g:airline#extensions#tabline#enabled = 1
" let g:airline_powerline_fonts = 1
" let g:airline_theme = 'solarized'
" set showcmd
" set noshowmode


" ========================================================
" NerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" ========================================================
" python.mode
let g:pymode_python = 'python3'


" ========================================================
" Custom functions
" Remove trailing whitespaces on save
autocmd BufWritePre * %s/\s\+$//e
" Restore last position in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"zz" | endif
endif


" ========================================================
" Clipboard
set pastetoggle=<F2>
set clipboard=unnamed


" ========================================================
" Default configuration
syntax on
set number
set wildmenu
set list
set listchars=tab:•\ ,trail:•,extends:»,precedes:«
set mouse=a
set relativenumber number

" Python specific
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set colorcolumn=80

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
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l

" Tab navigation
map <Leader>l <esc>:tabnext<CR>
map <Leader>h <esc>:tabprevious<CR>

" Useful bindings when working with python
vnoremap <Leader>s :sort<CR>

" Makes code block ident so much easier
vnoremap < <gv
vnoremap > >gv

" Plugin shortcuts
map <C-b> :NERDTreeToggle<CR>
