call plug#begin(stdpath('data') . '/plugged')

  " == Appearance
  Plug 'projekt0n/github-nvim-theme'

  " == Navigation
  Plug 'junegunn/fzf', { 'build': './install', 'merged': 0 }
  Plug 'junegunn/fzf.vim', { 'depends': 'fzf' }

  " == VC Support
  Plug 'tpope/vim-fugitive'

  " == Language support
  Plug 'fatih/vim-go'
  Plug 'google/vim-jsonnet'
  Plug 'hashivim/vim-terraform'
  Plug 'tsandall/vim-rego'
call plug#end()


filetype plugin indent on
syntax on

set encoding=UTF-8


" Visuals/Drawing Settings
set ttyfast lazyredraw termguicolors visualbell
colorscheme github_*
set background=dark


" Config starts
set wildmenu wildmode=longest:full,full
set nobackup nowritebackup history=100
set clipboard=unnamedplus
set undofile undodir="~/.vim/undo"

set ts=2 sw=2 expandtab
set hlsearch incsearch ignorecase smartcase
set noshowcmd noruler cursorline number scrolloff=4
set foldmethod=marker
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

let g:jsonnet_fmt_on_save = 0

vnoremap < <gv
vnoremap > >gv

" Happens all the time so lets be a bit more productive
command! Q q
command! W w
command! WQ wq
command! Wq wq
command! WA wa
command! Wa wa
command! QA qa
command! Qa qa
command! Wqa wqa
command! WQa wqa
command! WQA wqa

nnoremap <silent> <C-p> :Files<CR>
imap <C-c> <Esc>
