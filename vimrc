set nocompatible               " be iMproved
filetype off                   " required!

" Setup Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Bundles
Bundle 'ap/vim-css-color'
Bundle 'AndrewRadev/switch.vim'
Bundle 'arnaud-lb/vim-php-namespace'
Bundle 'beyondwords/vim-twig'
Bundle 'docunext/closetag.vim'
Bundle 'ervandew/supertab'
"Bundle 'EvanDotPro/phpcomplete.vim'
"Bundle 'shawncplus/phpcomplete.vim'
Bundle 'groenewege/vim-less'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'majutsushi/tagbar'
Bundle 'mileszs/ack.vim'
Bundle 'mikehaertl/pdv-standalone'
Bundle 'othree/html5.vim'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'vim-scripts/bufexplorer.zip'
Bundle 'vim-scripts/inline_edit.vim'

" Colors
Bundle 'altercation/vim-colors-solarized'
Bundle 'endel/vim-github-colorscheme'

let g:solarized_contrast="high" " Enable high contrast if using solarized

runtime! macros/matchit.vim " Enable matchit
set shortmess +=I           " Disable Splash Screen

let mapleader=','

set encoding=utf-8
set mouse+=a      " enable the mouse... naughty

set visualbell    " beep beep, no moar
set autoread      " auto read changes to files
"set nohidden
set laststatus=2  " always show status line

set number   " enable line numbers
set ruler    " show cursor position

" Global Undo
set undodir=~/.vim/.undo
set undofile
set undolevels=1000  " maximum number of changes that can be undone
set undoreload=10000 " maximum number lines to save for undo on a buffer reload

" no moar backup/swap files
set nobackup
set noswapfile
set nowritebackup

" Whitespace & Indenting
set autoindent                  " use previous line indent for newline
set smarttab                    " insert tabs on the start of a line according to shiftwidth, not tabstop
set nowrap                      " disable line wrapping
"set colorcolumn=80              " visual indicator at 80 chars
set tabstop=2                   " display tabs as 2 spaces
set shiftwidth=2                " Use 2 shifts for < and > shifting
set shiftround                  " Use multiple of shiftwidth when indenting with '<' and '>'
set softtabstop=2               " Use 2 spaces when hitting tab in insert mode
set expandtab                   " Expand tabs to spaces in insert mode

" Searching
set ignorecase     " ignore term case
set hlsearch       " highlight matched terms
set incsearch      " highlight as we search

" Misc
set foldenable foldmethod=marker
set showmatch      " highlight matching parenthesis
set ttyfast
set wildmenu
set wildmode=list:longest
set wildignore+=*/_build/*,*/_cache/*,*/docs/*,*/cache/*

" Turn filetype back on and enable syntax
syntax on
filetype plugin indent on

" Enable omni completion
set ofu=syntaxcomplete#Complete

" Declare some filetypes
au BufNewFile,BufRead {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru,Guardfile} set ft=ruby
au BufNewFile,BufRead *.json set ft=javascript
au BufNewFile,BufRead *vhost*.conf set ft=apache

" Load closetag for html files
au FileType html,jinjahtml,eruby,twig,html.twig let b:closetag_html_style=1
au FileType html,xhtml,xml,jinjahtml,eruby,twig,html.twig source ~/.vim/bundle/closetag.vim/plugin/closetag.vim

" Plugin Settings
let g:ackprg = 'ag --nogroup --nocolor --column' " use the_silver_searcher instead of ack

" {{{ ctrlp
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_working_path_mode = 0
" }}}

" {{{ nerdtree
let NERDChristmasTree   = 1
let NERDTreeHijackNetrw = 0
let NERDTreeMouseMode   = 2
let NERDTreeMinimalUI   = 1
let NERDTreeDirArrows   = 1
" }}}

" {{{ Tagbar
let g:tagbar_autofocus = 1
let g:tagbar_type_php  = {
    \ 'ctagstype' : 'php',
    \ 'kinds'     : [
      \ 'i:interfaces',
      \ 'c:classes',
      \ 'd:constant definitions',
      \ 'f:functions',
      \ 'j:javascript functions:1'
    \ ]
  \ }
let g:tagbar_compact=1
" }}}

" {{{ supertab
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabLongestHighlight = 1
let g:SuperTabNoCompleteAfter = ['^', ':', '\s', ']', ')', '"', "'"]
let g:SuperTabRetainCompletionDuration = 'completion' " defaults to 'insert'
" }}}

" {{{ Inline Edit
let g:inline_edit_autowrite = 1  " Auto write when saving buffer
" }}}

" PDV {{{
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR>

let g:pdv_cfg_Author    = "Eric Coleman <eric@colemando.com>"
let g:pdv_cfg_ReturnVal = ""
" }}}

" Keyboard Shortcuts
if has("mac")
  nnoremap <silent> <D-2> :BufExplorer<CR>
  nnoremap <silent> <D-3> :TagbarToggle<CR>
  noremap <silent> <D-4> :NERDTreeToggle<CR>
else
  nnoremap <silent> <F2> :BufExplorer<CR>
  nnoremap <silent> <F3> :TagbarToggle<CR>
  noremap <F4> :NERDTreeToggle<CR>
endif

" trigger switch.vim using -
nnoremap - :Switch<cr>

" automatically trim trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Use w!! to sudo write after opening a file without sudo rights
cmap w!! w !sudo tee % >/dev/null

