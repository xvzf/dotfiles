" Editor settings
set visualbell
set number relativenumber
set numberwidth=5
set laststatus=2
set noshowmode
set ruler
set cursorline
set signcolumn=yes
set scrolloff=8

" Colors
if (has("termguicolors"))
  set t_Co=256
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors

  let iterm_profile = $ITERM_PROFILE
  if iterm_profile == "dark"
    colorscheme onehalfdark
    let g:airline_theme='onehalfdark'
  else
    colorscheme onehalflight
    let g:airline_theme='onehalflight'
  endif

endif

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

" Have a nice looking fzf
if has('nvim-0.4.0') || has("patch-8.2.0191")
    let g:fzf_layout = { 'window': {
                \ 'width': 0.9,
                \ 'height': 0.8,
                \ 'highlight': 'Comment',
                \ 'rounded': v:false } }
else
    let g:fzf_layout = { "window": "silent botright 16split enew" }
endif
