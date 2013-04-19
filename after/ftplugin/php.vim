
setlocal softtabstop=4
setlocal tabstop=4
setlocal shiftwidth=4
setlocal keywordprg=/usr/bin/pman

" Add a use statement
imap <buffer> <Leader>u <C-O>:call PhpInsertUse()<CR>
map <buffer> <Leader>u :call PhpInsertUse()<CR>

" Expand a class name
imap <buffer> <Leader>e <C-O>:call PhpExpandClass()<CR>
map <buffer> <Leader>e :call PhpExpandClass()<CR>

