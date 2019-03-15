set nocompatible                " Enables us Vim specific features
filetype off                    " Reset filetype detection first ...
filetype plugin indent on       " ... and enable filetype detection

call plug#begin('~/.vim/plugged')
Plug 'sjl/badwolf'
Plug 'python-mode/python-mode', { 'branch': 'develop' }
call plug#end()


set ttyfast                     " Indicate fast terminal conn for faster redraw
set lazyredraw
set backspace=indent,eol,start  " Makes backspace key more powerful.
set noswapfile
set wildmenu
set list
set listchars=tab:•\ ,trail:•,extends:»,precedes:«
set number
set relativenumber number
set hlsearch
set incsearch
set ignorecase
set smartcase
set expandtab


" ========================================================
" Colors
syntax enable
colorscheme badwolf


" ========================================================
" Custom functions
" Restore last position in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"zz" | endif
endif


" Copies using system clipboard
if has('unnamedplus')
  set clipboard^=unnamed
  set clipboard^=unnamedplus
endif

" This enables us to undo files even if you exit Vim.
if has('persistent_undo')
  set undofile
  set undodir=~/tmp/vim/undo/
endif

au BufNewFile *.py set
    \ fileformat=unix
" It annoys me every time but it is uncool to have a 1k empty lines+ PR request, I'll do it anyway :-)
au BufWritePre *
    \ %s/\s\+$//e

" 2 Spaces
au BufNewFile,BufRead *.sh,*.js,*.jsx,*.ts,*.tsx,*.yml,*.json,*.sql set
    \ tabstop=2
    \ softtabstop=2
    \ shiftwidth=2

" 4 Spaces
au BufNewFile,BufRead *.py set
    \ tabstop=4
    \ softtabstop=4
    \ shiftwidth=4

"
"
" Makes code block ident so much easier
vnoremap < <gv
vnoremap > >gv

" Remap ESC
imap <C-c> <Esc>

" Leader bindings
let mapleader = ","


" ==== python-mode
let g:pymode_python = 'python3'
nmap <Leader>r <esc>:PymodeRun<CR>

" ==== vim-go
" let g:go_fmt_command = "goimports"
" let g:go_autodetect_gopath = 1
" let g:go_list_type = "quickfix"
"
" let g:go_highlight_types = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_functions = 1
" let g:go_highlight_function_calls = 1
" let g:go_highlight_extra_types = 1
" let g:go_highlight_generate_tags = 1

