" ========================================================
" Autocomplete

call deoplete#custom#option('sources', {
\ '_': ['buffer'],
\ 'cpp': ['LanguageClient'],
\ 'c': ['LanguageClient'],
\ 'python': ['LanguageClient'],
\ 'java': ['LanguageClient'],
\ 'javascript': ['LanguageClient'],
\})

let g:deoplete#enable_at_startup = 1
