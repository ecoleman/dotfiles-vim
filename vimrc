
set nocompatible

filetype off

if ! has('gui')
  let g:pathogen_disabled = ['CSApprox']
endif

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

syntax on
filetype on
filetype plugin indent on

" Pasting toggle...
:set pastetoggle=<Ins>

" searching
set hlsearch
set incsearch

" tabs
set softtabstop=2
set shiftwidth=2
set expandtab

set smarttab
set smartindent

set ruler
set number

set showmatch
set matchtime=1
set backspace=indent,eol,start

set nowrap

set mouse-=a

:set t_Co=256
:colorscheme wombat 

":set foldenable foldmethod=manual
:set foldenable foldmethod=marker

" Mappings
noremap <C-d> :NERDTreeToggle<CR>

" autocomplete funcs and identifiers for languages
autocmd FileType php set softtabstop=4
autocmd FileType php set shiftwidth=4

if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
  \	if &omnifunc == "" |
  \		setlocal omnifunc=syntaxcomplete#Complete |
  \	endif
endif

autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd BufNewFile,BufRead Thorfile set ft=ruby

" Load a tag file
" Loads a tag file from ~/.vim.tags/, based on the argument provided. The
" command "Ltag"" is mapped to this function.
:function! LoadTags(file)
:   let tagspath = $HOME . "/.vim.tags/" . a:file
:   let tagcommand = 'set tags+=' . tagspath
:   execute tagcommand
:endfunction
:command! -nargs=1 Ltag :call LoadTags("<args>")

" These are tag files I've created; you may want to remove/change these for your
" own usage.
:Ltag pf_core

" PHP syntax settings
:let php_sql_query=1
:let php_htmlInStrings=1
":let php_folding=1
:let php_parent_error_close=1
:let php_parent_error_open=1

:let bash_is_sh=1

if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
endif

command WW w !sudo tee % > /dev/null

" supertab settings
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

