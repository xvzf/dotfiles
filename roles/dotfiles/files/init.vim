call plug#begin(stdpath('data') . '/plugged')
"
  " == Appearance
  Plug 'muchzill4/doubletrouble'

  " == Searching
  Plug 'junegunn/fzf', { 'build': './install', 'merged': 0 }
  Plug 'junegunn/fzf.vim', { 'depends': 'fzf' }

  " == VC Support
  Plug 'tpope/vim-fugitive'
  Plug 'lewis6991/gitsigns.nvim'
  " Plug 'sindrets/diffview.nvim'

  " == Highlighting
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}


  " == Language support
  Plug 'ray-x/go.nvim'
  Plug 'ray-x/guihua.lua' " required by ray-x/go.nvim
  Plug 'google/vim-jsonnet'

  " == Autocompletion
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/nvim-cmp'

  " == LSP Configuration
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'hrsh7th/vim-vsnip-integ'

  " I'll never need snippets anymore!
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


" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
nmap        s   <Plug>(vsnip-select-text)
xmap        s   <Plug>(vsnip-select-text)
nmap        S   <Plug>(vsnip-cut-text)
xmap        S   <Plug>(vsnip-cut-text)


lua <<EOF
  -- gitsings
  require('gitsigns').setup()
  -- treesitter
  require'nvim-treesitter.configs'.setup {
    ensure_installed = {
      "c",
      "lua",
      "vim",
      "vimdoc",
      "query",
      "go",
      "gomod",
      "gosum",
      "terraform",
      "jsonnet",
      "python",
      "bash",
      "diff",
      "dockerfile",
      "javascript",
      "typescript",
      "sql",
      "yaml",
      "markdown_inline"
    },
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
      disable = {},
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true
    }
  }
  -- lspconfig
  local lsp = require('lspconfig')
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  lsp.bashls.setup{capabilities = capabilities}
  lsp.jsonnet_ls.setup{capabilities = capabilities}
  lsp.pyright.setup{capabilities = capabilities}
  lsp.terraformls.setup{capabilities = capabilities}
  lsp.gopls.setup{
    capabilities = capabilities,
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      },
    },
  }
  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
      -- Enable completion triggered by <c-x><c-o>
      vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

      -- Buffer local mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local opts = { buffer = ev.buf }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
      vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
      vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
      vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, opts)
      vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
      vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
      vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      vim.keymap.set('n', '<space>f', function()
        vim.lsp.buf.format { async = true }
      end, opts)
    end,
  })
  -- Golang specific setup
  require('go').setup()

  -- Dynamic autocomplete with cmp
  local cmp = require('cmp')
    cmp.setup({
      snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
    })
  })


EOF

" Foldmethods
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

" Nice way to fold multi-stage dockerfiles; credit to @jzck
autocmd FileType dockerfile setlocal foldmethod=expr
autocmd FileType dockerfile setlocal foldexpr=get(split(getline(v:lnum)),0,'')==?'FROM'?'>1':'='

colorscheme doubletrouble
set bg=dark

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

let g:jsonnet_fmt_on_save = 1

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

imap <C-c> <Esc>
