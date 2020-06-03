" It will be annoying but I don't care :-P
au BufWritePre *.py,*yaml,*.yml,*.sql,*.tf
    \ %s/\s\+$//e
au BufNewFile,BufRead *.jsonnet,*.tf,*.md,*.sh,*.js,*.jsx,*.ts,*.tsx,*.yml,*.yaml,*.json,*.sql,*.vim set
    \ tabstop=2
    \ softtabstop=2
    \ shiftwidth=2
au BufNewFile,BufRead *.py set
    \ tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
