" DEIN package manager
if &compatible
  set nocompatible
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Plugins {{{
  if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')

    call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

    " == Navigation
    call dein#add('itchyny/vim-cursorword')
    call dein#add('junegunn/fzf', { 'build': './install', 'merged': 0 })
    call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
    call dein#add('tpope/vim-surround')

    " == Language support
    call dein#add('fatih/vim-go')
    call dein#add('google/vim-jsonnet')

    " == Autocomplete, Snippets
    call dein#add('neoclide/coc.nvim', {'merged':0, 'rev': 'release'})
    " call dein#add('preservim/nerdcommenter')
    " call dein#add('neoclide/coc-snippets')

    " == Git
    call dein#add('tpope/vim-fugitive')

    " == Appearence
    call dein#add('reedes/vim-colors-pencil')


    call dein#end()
    call dein#save_state()
  endif

  filetype plugin indent on
  syntax enable
" }}}

" Speed things up a bit {{{
  set ttyfast
  set lazyredraw

  set noshowcmd
  set noruler
" }}}

" Settings {{{
  set encoding=UTF-8
  set wildmenu

    " Backspace and tab {{{
    set backspace=indent,eol,start
    set expandtab
    "}}}

    " Search Settings {{{
    set hlsearch
    set incsearch
    set ignorecase
    set smartcase
    " }}}

    " Window splitting {{{
    set splitbelow
    set splitright
    " }}}

    " History + OS integration {{{
    set nobackup
    set nowritebackup
    set history=50

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
      set undodir=~/.vim/undo/
    endif

    " Move to last file position
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
    " }}}

" }}}

" Appearance {{{
  set termguicolors

  let iterm_profile = $ITERM_PROFILE
  if iterm_profile == "light"
    set background=light
  endif

  colorscheme pencil

  set visualbell
  set number
  set numberwidth=3
  set laststatus=2
  set signcolumn=yes
  set scrolloff=6

  highlight ExtraWhitespace ctermbg=red guibg=red
  match ExtraWhitespace /\s\+$/
  set listchars=tab:>>,extends:>,precedes:<,space:·
  set list
" }}}

" Buffer Settings {{{
  " It will be annoying but I don't care :-P
  " au BufWritePre *.py,*yaml,*.yml,*.sql,*.tf
      " \ %s/\s\+$//e

  au BufNewFile,BufRead *.md,*.sh,*.tsx,*.yml,*.yaml*.sql,*.vim set
      \ tabstop=2
      \ softtabstop=2
      \ shiftwidth=2
      \ foldmethod=marker

  au BufNewFile,BufRead *.libsonnet,*.jsonnet,*.json,*.js,*.tf set
      \ tabstop=2
      \ softtabstop=2
      \ shiftwidth=2
      \ foldmethod=syntax

  au BufNewFile,BufRead *.go set
      \ foldmethod=syntax

  au BufNewFile,BufRead *.py set
      \ tabstop=4
      \ softtabstop=4
      \ shiftwidth=4
      \ foldmethod=syntax
" }}}

" COC settings {{{
" Show documentation
  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  set updatetime=300
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " don't give |ins-completion-menu| messages.
  set shortmess+=c
" }}}

" Go Settings {{{
  let g:go_doc_popup_window = 1
  let g:go_highlight_extra_types = 1
  let g:go_highlight_build_constraints = 1
  let g:go_highlight_extra_types = 1
  let g:go_highlight_fields = 1
  let g:go_highlight_format_strings = 1
  let g:go_highlight_functions = 1
  let g:go_highlight_function_calls = 1
  let g:go_highlight_function_parameters = 1
  let g:go_highlight_types = 1
  let g:go_highlight_generate_tags = 1
  let g:go_highlight_operators = 1
  autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
"}}}

" Shortcuts {{{
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

" Space as leader key
let mapleader = " "
let maplocalleader = ","
map <C-n> :NERDTreeToggle<CR>

" Easier indentation
vnoremap < <gv
vnoremap > >gv

imap <C-c> <Esc>
nnoremap <Leader>, :set cursorline!<CR>

nnoremap <silent> <C-p> :Files<CR>
nmap <Leader>f <esc>:Rg<CR>

nmap gd <esc>:call CocActionAsync('jumpDefinition')<CR>
nmap gy <esc>:call CocActionAsync('jumpTypeDefinition')<CR>
nmap gi <esc>:call CocActionAsync('jumpImplementation')<CR>
nmap gr <esc>:call CocActionAsync('jumpReferences')<CR>
nmap <leader>rn <esc>:call CocActionAsync('rename')<CR>
nnoremap K <esc>:call <SID>show_documentation()<CR>

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" }}}
