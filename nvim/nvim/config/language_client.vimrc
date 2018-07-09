" let g:LanguageClient_loadSettings = 1
" let g:LanguageClient_settingsPath = 'C:\path\to\settings.json'

let g:LanguageClient_serverCommands = {
            \ 'c': ['cquery', '--log-file=/tmp/cq.log'],
            \ 'cpp': ['cquery', '--log-file=/tmp/cq.log'],
            \ 'java': ['jdtls'],
            \ 'javascript': ['javascript-typescript-stdio'],
            \ 'python': ['/home/xvzf/.vim/virtualenv/bin/pyls', '-v'],
            \ }
let g:LanguageClient_autoStart = 1

" set completefunc=LanguageClient#complete
" set formatexpr=LanguageClient_textDocument_rangeFormatting()
