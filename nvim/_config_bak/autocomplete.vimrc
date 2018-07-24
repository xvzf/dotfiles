" ========================================================
" Autocomplete

call deoplete#custom#option('sources', {
\ '_': ['buffer'],
\ 'python': ['LanguageClient', 'buffer'],
\})

let g:deoplete#enable_at_startup = 1
