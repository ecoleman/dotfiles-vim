
set nocompatible

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

syntax on
filetype plugin on

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

" Mappings
noremap <C-d> :NERDTreeToggle<CR>

" autocomplete funcs and identifiers for languages
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

command W w !sudo tee % > /dev/null

