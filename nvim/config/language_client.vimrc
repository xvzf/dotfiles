let g:LanguageClient_serverCommands = {
            \ 'cpp': ['cquery', '--log-file=/tmp/cq.log'],
            \ 'c': ['cquery', '--log-file=/tmp/cq.log'],
            \ 'python': ['/home/xvzf/.vim/virtualenv/bin/pyls', '-v'],
            \ }
let g:LanguageClient_autoStart = 1

" set completefunc=LanguageClient#complete
set formatexpr=LanguageClient_textDocument_rangeFormatting()
