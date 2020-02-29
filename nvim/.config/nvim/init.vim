if &compatible
  set nocompatible
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  " == Navigation
  call dein#add('preservim/nerdtree')
  call dein#add('itchyny/vim-cursorword')
  call dein#add('mhinz/vim-startify')
  call dein#add('~/.fzf')
  call dein#add('junegunn/fzf.vim')
  call dein#add('tpope/vim-surround')
  call dein#add('christoomey/vim-tmux-navigator')

  " == Writing
  call dein#add('junegunn/goyo.vim')
  call dein#add('junegunn/limelight.vim')

  " == Language support
  call dein#add('fatih/vim-go')

  " == Autocomplete, Snippets
  call dein#add('neoclide/coc.nvim', {'merged':0, 'rev': 'release'})
  call dein#add('preservim/nerdcommenter')
  call dein#add('neoclide/coc-snippets')
  call dein#add('neoclide/coc-pairs')
  call dein#add('neoclide/coc-json')
  call dein#add('neoclide/coc-yaml')
  call dein#add('neoclide/coc-tsserver')
  call dein#add('neoclide/coc-python')
  call dein#add('marlonfan/coc-phpls')
  call dein#add('weirongxu/coc-calc')

  " == Git
  call dein#add('tpope/vim-fugitive')

  " == Appearence
  call dein#add('sheerun/vim-polyglot')
  call dein#add('Yggdroot/indentLine')
  call dein#add('yorickpeterse/happy_hacking.vim')
  call dein#add('itchyny/lightline.vim')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable
" Common stuff for navigation
set backspace=indent,eol,start
if !has('nvim')
  set encoding=UTF-8
  set wildmenu
endif
set hlsearch
set incsearch
set ignorecase
set smartcase
set expandtab
set splitbelow
set splitright

" Appearance
set visualbell
set number
set relativenumber number
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_guifg = 'DarkGray'
colorscheme happy_hacking
set noshowmode

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


" It will be annoying but I don't care :-P
au BufWritePre *.py,*yaml,*.yml,*.sql,*.tf
    \ %s/\s\+$//e
au BufNewFile,BufRead *.tf,*.md,*.sh,*.js,*.jsx,*.ts,*.tsx,*.yml,*.yaml,*.json,*.sql,*.vim set
    \ tabstop=2
    \ softtabstop=2
    \ shiftwidth=2
au BufNewFile,BufRead *.py set
    \ tabstop=4
    \ softtabstop=4
    \ shiftwidth=4

" == Plugin configuration
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

let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1

" == Autocompletion config

" == Shortcuts
let mapleader = ","
map <C-n> :NERDTreeToggle<CR>
vnoremap < <gv
vnoremap > >gv
imap <C-c> <Esc>
nmap <Leader>o <esc>:FZF<CR>
nmap <Leader>a <esc>:Ag<CR>
nmap gd <esc>:call CocActionAsync('jumpDefinition')<CR>
nmap gy <esc>:call CocActionAsync('jumpTypeDefinition')<CR>
nmap gi <esc>:call CocActionAsync('jumpImplementation')<CR>
nmap gr <esc>:call CocActionAsync('jumpReferences')<CR>
nnoremap K <esc>:call <SID>show_documentation()<CR>
nnoremap <Leader>, :set cursorline!<CR>
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" == Functions
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
