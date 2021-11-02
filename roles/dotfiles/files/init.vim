call plug#begin(stdpath('data') . '/plugged')

  " == Appearance
  Plug 'projekt0n/github-nvim-theme'
  Plug 'nvim-lualine/lualine.nvim'

  Plug 'rktjmp/lush.nvim'
  Plug 'mcchrish/zenbones.nvim'
  Plug 'projekt0n/github-nvim-theme'

  " == Navigation
  Plug 'junegunn/fzf', { 'build': './install', 'merged': 0 }
  Plug 'junegunn/fzf.vim', { 'depends': 'fzf' }
  Plug 'phaazon/hop.nvim'

  " == VC Support
  Plug 'tpope/vim-fugitive'

  " == Language support

  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate', 'branch': '0.5-compat'}  " Advanced parsing and syntax highlighting
  Plug 'neovim/nvim-lspconfig'
  Plug 'ray-x/go.nvim'
  Plug 'google/vim-jsonnet'
  Plug 'hashivim/vim-terraform'
  Plug 'tsandall/vim-rego'
call plug#end()


filetype plugin indent on
syntax on

set encoding=UTF-8


" Visuals/Drawing Settings
set ttyfast lazyredraw termguicolors visualbell


lua <<EOF
require("github-theme").setup {
  theme_style = "dark_default",
  function_style = "bold",
}
require('lualine').setup {
   options = {
    section_separators = { left = ' ', right = ' '},
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', {'diagnostics', sources={'nvim_lsp'}}},
    lualine_c = {'filename'},
    lualine_x = {},
    lualine_y = {'encoding'},
    lualine_z = {'location'}

  },

}
EOF
set background=dark

lua <<EOF
require'lspconfig'.terraformls.setup{}
require'lspconfig'.pyright.setup{}

EOF


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
