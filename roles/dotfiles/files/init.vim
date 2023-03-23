call plug#begin(stdpath('data') . '/plugged')
  Plug 'nvim-lua/plenary.nvim'

  " == Appearance
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'savq/melange'
  Plug 'rktjmp/lush.nvim'
  Plug 'folke/twilight.nvim'

  " == Navigation
  Plug 'junegunn/fzf', { 'build': './install', 'merged': 0 }
  Plug 'junegunn/fzf.vim', { 'depends': 'fzf' }
  Plug 'phaazon/hop.nvim'
  Plug 'liuchengxu/vim-which-key'

  " == VC Support
  Plug 'tpope/vim-fugitive'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'sindrets/diffview.nvim'


  " == Language support
  Plug 'nvim-treesitter/nvim-treesitter', { 'branch': 'master', 'do': ':TSUpdate'}  " Advanced parsing and syntax highlighting
  Plug 'neovim/nvim-lspconfig'
  Plug 'ray-x/go.nvim'
  Plug 'google/vim-jsonnet'
  Plug 'hashivim/vim-terraform'
  Plug 'tsandall/vim-rego'

  Plug 'github/copilot.vim'
call plug#end()


filetype plugin indent on
syntax on

set encoding=UTF-8


" Visuals/Drawing Settings
set ttyfast lazyredraw visualbell
" Enable true color 启用终端24位色
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif


lua <<EOF
require('gitsigns').setup()

EOF

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
EOF

" Foldmethods
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
" Nice way to fold multi-stage dockerfiles; credit to @jzck
autocmd FileType dockerfile setlocal foldmethod=expr
autocmd FileType dockerfile setlocal foldexpr=get(split(getline(v:lnum)),0,'')==?'FROM'?'>1':'='

colorscheme melange
set bg=light

lua <<EOF
local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<F6>', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<a-cr>', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
end

nvim_lsp.pyright.setup{on_attach = on_attach}
-- nvim_lsp.yamlls.setup {on_attach = on_attach}
nvim_lsp.terraformls.setup{on_attach = on_attach}
require'lspconfig'.jsonnet_ls.setup{on_attach = on_attach}
require'lspconfig'.bashls.setup{}

-- Twilight code section highlighting
require("twilight").setup{}

EOF


" Config starts
set wildmenu wildmode=longest:full,full
set nobackup nowritebackup history=100
set clipboard=unnamedplus
set undofile undodir="~/.vim/undo"

set ts=2 sw=2 expandtab
set hlsearch incsearch ignorecase smartcase
set noshowcmd noruler cursorline number scrolloff=4
set fixendofline
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

let g:jsonnet_fmt_on_save = 0

set bg=dark

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

let mapleader = ' '
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
nnoremap <silent> <C-p> :Files<CR>
imap <C-c> <Esc>
