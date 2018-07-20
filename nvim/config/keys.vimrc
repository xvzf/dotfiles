" ========================================================
" Shortcuts

" Set <Leader>
let mapleader="\<space>"

" imap <C-c> <esc>
" Terminal navigation
" tnoremap <C-c><C-c> <C-\><C-N>

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
nmap <Leader><Space> <esc>:pclose<CR>

" Files
nmap <Leader>f <esc>:Files<CR>
nmap <c-s> <esc>:w<CR>

" Makes code block ident so much easier
vnoremap < <gv
vnoremap > >gv

" Plugin shortcuts
map <C-b> :NERDTreeToggle<CR>
map <C-t> :TagbarToggle<CR>

" Search shortcuts
vnoremap <Leader>q <esc>:noh<CR>

" LanguageClient
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>


" Search
vnoremap <CR> y/\V<C-R>"<CR>

" NCM2
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
