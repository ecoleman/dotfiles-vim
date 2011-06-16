
set nocompatible

filetype off

if ! has('gui')
  let g:pathogen_disabled = ['CSApprox']
endif

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"syntax on
syntax enable
filetype on

filetype plugin indent on

set t_Co=256
set background=dark
colorscheme wombat 
"let g:solarized_termcolors=256
"colorscheme solarized


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

" status crap
set ls=2
if has('statusline')
  " Status line detail:
   " %f     file path
   " %y     file type between braces (if defined)
   " %([%R%M]%)   read-only, modified and modifiable flags between braces
   " %{'!'[&ff=='default_file_format']}
   "        shows a '!' if the file format is not the platform
   "        default
   " %{'$'[!&list]}  shows a '*' if in list mode
   " %{'~'[&pm=='']} shows a '~' if in patchmode
   " (%{synIDattr(synID(line('.'),col('.'),0),'name')})
   "        only for debug : display the current syntax item name
   " %=     right-align following items
   " #%n    buffer number
   " %l/%L,%c%V   line number, total number of lines, and column number
   function SetStatusLineStyle()
      if &stl == '' || &stl =~ 'synID'
         "let &stl="%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L] "
         let &stl="%f %y%([%R%M]%)%{'!'[&ff=='".&ff."']}%{'$'[!&list]}%{'~'[&pm=='']}%=#%n %l/%L,%c%V "
      else
         let &stl="%f %y%([%R%M]%)%{'!'[&ff=='".&ff."']}%{'$'[!&list]} (%{synIDattr(synID(line('.'),col('.'),0),'name')})%=#%n %l/%L,%c%V "
      endif
   endfunc
   " Switch between the normal and vim-debug modes in the status line
   nmap _ds :call SetStatusLineStyle()<CR>
   call SetStatusLineStyle()
   " Window title
   if has('title')
      set titlestring=%t%(\ [%R%M]%)
   endif
endif

set showmatch
set matchtime=1
set backspace=indent,eol,start

set nowrap

if has('gui')
  set mouse+=a
endif


":set foldenable foldmethod=manual
:set foldenable foldmethod=marker

" Mappings
noremap <C-d> :NERDTreeToggle<CR>

" autocomplete funcs and identifiers for languages
au FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType php set omnifunc=phpcomplete#Complete
autocmd FileType php set softtabstop=4
autocmd FileType php set shiftwidth=4

"if has("autocmd") && exists("+omnifunc")
  "autocmd Filetype *
  "\	if &omnifunc == "" |
  "\		setlocal omnifunc=syntaxcomplete#Complete |
  "\	endif
"endif

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
:Ltag pf_cms-trunk

" PHP syntax settings
let php_sql_query=1
let php_htmlInStrings=1
":let php_folding=1
let php_parent_error_close=1
let php_parent_error_open=1

":let bash_is_sh=1

if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
endif

cmap w!! w !sudo tee >/dev/null %

" supertab settings
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<C-X><C-O>"
"let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

" Syntastic Config
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2 " 1 = auto open & close, 3 = auto close
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


