
" Editor settings
set visualbell
set number
set numberwidth=5
set laststatus=2
set noshowmode
set ruler
set signcolumn=yes

" Colors
colorscheme happy_hacking
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_guifg = 'DarkGray'

" Startify settings
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1

" Focused editing
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Airline
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#show_buffers = 0
