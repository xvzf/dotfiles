" Editor settings
set visualbell
set number
set numberwidth=5
set laststatus=2
set noshowmode
set ruler
set cursorline
set signcolumn=yes

" Colors
if (has("termguicolors"))
  set termguicolors
endif
let g:nord_cursor_line_number_background = 1
colorscheme nord
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }

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
