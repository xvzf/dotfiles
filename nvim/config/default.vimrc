" ========================================================
" Custom functions
" Restore last position in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"zz" | endif
endif


" ========================================================
" Default configuration
syntax on
set wildmenu
set list
set mouse=a
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
" It annoys me every time but it is uncool to have a 1k empty lines+ PR request
" au BufWritePre *.py
"     \ %s/\s\+$//e

" HTML/JS specific
au BufNewFile,BufRead *.js,*.jsx,*.ts,*.tsx set
    \ tabstop=2
    \ softtabstop=2
    \ shiftwidth=2

" Search specific
set hlsearch
set incsearch
set ignorecase
set smartcase

" Fold specific
" set foldlevelstart=1
