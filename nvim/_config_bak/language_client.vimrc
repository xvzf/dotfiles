" let g:LanguageClient_loadSettings = 1
" let g:LanguageClient_settingsPath = 'C:\path\to\settings.json'

let g:LanguageClient_serverCommands = {
            \ 'python': ['/home/xvzf/.vim/virtualenv/bin/pyls', '-v'],
            \ }
let g:LanguageClient_autoStart = 1

" set formatexpr=LanguageClient_textDocument_rangeFormatting()
