" ========================================================
" Autocomplete

call deoplete#custom#option('sources', {
\ '_': ['buffer'],
\ 'cpp': ['LanguageClient'],
\ 'python': ['LanguageClient']
\})

let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif


" ========================================================
" Snippets
let g:neosnippet#enable_completed_snippet = 1
let g:neosnippet#disable_runtime_snippets = {
\   '_' : 1,
\ }
let g:neosnippet#snippets_directory  = "${HOME}/.config/nvim/snippets"
" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
