" ========================================================
" Shortcuts

" Set <Leader>
let mapleader=","

" Terminal navigation
tnoremap <esc><esc> <C-\><C-N>

" Split navigation
map <Leader>v <esc>:vsplit<CR>
map <Leader>s <esc>:split<CR>
map <Leader>d <esc>:close<CR>
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l

" Tab navigation
map <Leader>c <esc>:tabnew<CR>
map <Leader>l <esc>:tabnext<CR>
map <Leader>h <esc>:tabprevious<CR>

" Files
map <Leader>f <esc>:FZF<CR>
map <c-s> <esc>:w<CR>

" Makes code block ident so much easier
vnoremap < <gv
vnoremap > >gv

" Folding
nnoremap <space> za
map <Leader>fa zM
map <Leader>fu zR

" Plugin shortcuts
map <C-b> :NERDTreeToggle<CR>
map <C-t> :TagbarToggle<CR>

" Deoplete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
imap <C-l>     <Plug>(neosnippet_expand_or_jump)
smap <C-l>     <Plug>(neosnippet_expand_or_jump)
xmap <C-l>     <Plug>(neosnippet_expand_target)

" Search shortcuts
map <Leader>q <esc>:noh<CR>
