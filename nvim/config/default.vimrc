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
set ruler
set relativenumber number

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab


" Copies using system clipboard
set clipboard=unnamedplus
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
" au BufWritePre *.py
"     \ %s/\s\+$//e

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

