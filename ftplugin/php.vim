
" Documentation {{{

source ~/.vim/php/php-doc.vim
" Map <ctrl>+p to single line mode documentation (in insert and command mode)
inoremap <C-P> :call PhpDocSingle()<CR>
nnoremap <C-P> :call PhpDocSingle()<CR>
" Map <ctrl>+p to multi line mode documentation (in visual mode)
vnoremap <C-P> :call PhpDocRange()<CR>
" }}}

