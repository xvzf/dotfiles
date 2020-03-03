" Show documentation
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

set updatetime=300
autocmd CursorHold * silent call CocActionAsync('highlight')

" don't give |ins-completion-menu| messages.
set shortmess+=c

