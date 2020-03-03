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

" Easymotion configuration
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1
nmap <Leader><space> <Plug>(easymotion-overwin-f2)
