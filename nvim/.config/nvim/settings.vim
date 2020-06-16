" Backspace and tab
set backspace=indent,eol,start
set expandtab

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase

" Window splitting
set splitbelow
set splitright
" set relativenumber number

set nobackup
set nowritebackup
set history=50

" Folding
set foldmethod=marker
"augroup AutoSaveFolds
  "autocmd!
  "autocmd BufWinLeave * mkview
  "autocmd BufWinEnter * silent loadview
"augroup END


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

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif
