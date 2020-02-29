source ~/.vim/vim-plug/plug.vim

set nocompatible                " Enables us Vim specific features
set visualbell                  " Don't be annoying :-)
filetype off                    " Reset filetype detection first ...
filetype plugin indent on       " ... and enable filetype detection

call plug#begin('~/.vim/plugged')

" Functionality
Plug 'sheerun/vim-polyglot'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'

" Appearance
Plug 'itchyny/lightline.vim'
Plug 'owickstrom/vim-colors-paramount'
Plug 'http://gitlab.com/yorickpeterse/happy_hacking.vim'
Plug 'scrooloose/nerdtree'
Plug 'Yggdroot/indentLine'

" Coding
" Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'fatih/vim-go'
call plug#end()

set ttyfast                     " Indicate fast terminal conn for faster redraw
set backspace=indent,eol,start  " Makes backspace key more powerful.
set noswapfile
set wildmenu
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
set term=screen-256color
" set cursorline
colorscheme happy_hacking

" Lightline
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }


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
else
  set clipboard=unnamed
endif

" This enables us to undo files even if you exit Vim.
if has('persistent_undo')
  set undofile
  set undodir=~/tmp/vim/undo/
endif

" Something like fuzzy find builtin
set path+=**

au BufNewFile *.py set
    \ fileformat=unix

" It annoys me every time but it is uncool to have a 1k empty lines+ PR request, I'll do it anyway :-)
au BufWritePre *.py
    \ %s/\s\+$//e

" 2 Spaces
au BufNewFile,BufRead *.tf,*.md,*.sh,*.js,*.jsx,*.ts,*.tsx,*.yml,*.yaml,*.json,*.sql set
    \ tabstop=2
    \ softtabstop=2
    \ shiftwidth=2

" 4 Spaces
au BufNewFile,BufRead *.py set
    \ tabstop=4
    \ softtabstop=4
    \ shiftwidth=4

" Split view gets usable now
set splitbelow
set splitright


" Makes code block ident so much easier
vnoremap < <gv
vnoremap > >gv

" Remap ESC
imap <C-c> <Esc>

" Leader bindings
let mapleader = ","

" Ctags
command! MakeTags !ctags -R .

" NerdTree
:nnoremap <C-b> :NERDTreeToggle<CR>

" ==== vim-go
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

" ==== Startify
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1

" ==== Fuzzyfind
nmap <Leader>o <esc>:FZF<CR>
nmap <Leader>a <esc>:Ag<CR>