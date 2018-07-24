" ========================================================
" Shortcuts

" Set <Leader>
let mapleader="\<space>"

imap <C-c> <esc>
" Terminal navigation
tnoremap <C-c><C-c> <C-\><C-N>

" Split navigation
nmap <Leader>v <esc>:vsplit<CR>
nmap <Leader>s <esc>:split<CR>
nmap <Leader>q <esc>:close<CR>
nmap <c-h> <c-w>h
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l

" Tab/Window navigation
nmap <Leader>b <esc>:Buffers<CR>
nmap <Leader>t <esc>:BTags<CR>
nmap <Leader>a <esc>:Ag<CR>

" Files
nmap <Leader>f <esc>:Files<CR>
nmap <c-s> <esc>:w<CR>

" Makes code block ident so much easier
vnoremap < <gv
vnoremap > >gv

" Plugin shortcuts
map <C-b> :NERDTreeToggle<CR>
map <C-t> :TagbarToggle<CR>

" Deoplete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Search shortcuts
vnoremap <Leader>q <esc>:noh<CR>
