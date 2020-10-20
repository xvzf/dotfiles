" It will be annoying but I don't care :-P
au BufWritePre *.py,*yaml,*.yml,*.sql,*.tf
    \ %s/\s\+$//e

au BufNewFile,BufRead *.md,*.sh,*.tsx,*.yml,*.yaml*.sql,*.vim set
    \ tabstop=2
    \ softtabstop=2
    \ shiftwidth=2

au BufNewFile,BufRead *.libsonnet,*.jsonnet,*.tf,*.js,*.jsx,*.ts,*.json, set
    \ tabstop=2
    \ softtabstop=2
    \ shiftwidth=2
    \ foldmethod=syntax

au BufNewFile,BufRead *.py set
    \ tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
