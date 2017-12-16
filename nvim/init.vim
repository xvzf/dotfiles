"NeoBundle Scripts-----------------------------
if has('vim_starting')
  " Required:
  set runtimepath+=/home/xvzf/.vim/bundle/neobundle.vim
endif

" Required:
call neobundle#begin(expand('/home/xvzf/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
" NerdTree
NeoBundle 'scrooloose/nerdtree'

" Appearance
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'ryanoasis/vim-devicons'
NeoBundle 'sickill/vim-monokai'

" Auto Complete
NeoBundle 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Utils
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'Valloric/MatchTagAlways'
NeoBundle 'tpope/vim-surround'

" Navigation
NeoBundle 'terryma/vim-multiple-cursors'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------


" Defines
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:indentLine_setColors = 0
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let $NVIM_TUI_ENABLE_TRUE_CURSOR_SHAPE=1

syntax on
filetype plugin indent on
syntax enable

" Theme
if (has("termguicolors"))
    set termguicolors
endif
colorscheme monokai
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

set number
set mouse=c
set laststatus=2
set wildmenu
set list          " Display unprintable characters f12 - switches
set listchars=tab:•\ ,trail:•,extends:»,precedes:« " Unprintable chars mapping
set shiftwidth=4
set tabstop=4
set expandtab
set showcmd
set noshowmode
set relativenumber number
set undofile
set undodir="$HOME/.NVIM_UNDO_FILES"
set cursorline
set wrap linebreak nolist

" Remember cursor position between vim sessions
autocmd BufReadPost *
		\	if line("'\"") > 0 && line ("'\"") <= line("$") |
		\	exe "normal! g'\"" |
		\	endif
" center buffer around cursor when opening files
autocmd BufRead * normal zz

" Use deoplete.
let g:deoplete#enable_at_startup = 1

"================================================================================

" Plugin Shortcuts
map <silent> <C-O> :NERDTreeToggle<CR>

" I hate macros
map Q <nop>
map q <nop>

" Really usefull for latex editing
noremap <silent> j gj
noremap <silent> k gk

" Navigation shortcuts
noremap <silent> H ^
noremap <silent> L $
noremap <silent> J 5j
noremap <silent> K 5k
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" System Clipboard
vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" Keyboard shortcuts
nnoremap <silent> <space> :noh<CR>
nnoremap <PageUp> k
nnoremap <PageDown> j
vnoremap <C-/> :TComment
map "p o <ESC>x3a"<ESC>a
