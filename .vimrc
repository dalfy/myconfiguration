if v:progname =~? "evim"
  finish
endif

"colorscheme murphy
if v:progname =~? "gvim"
    colorscheme elmindreda
endif

set nocompatible
set backspace=indent,eol,start
set nobackup  	" do not keep a backup file, use versions instead
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

set diffopt+=iwhite

map Q gq

set mouse=r

syntax on
set hlsearch

filetype plugin indent on

augroup vimrcEx
au!

autocmd FileType text setlocal textwidth=78

"autocmd BufReadPost *
"  \ if line("'\"") > 0 && line("'\"") <= line("$") |
"  \   exe "normal g`\"" |
"  \ endif

augroup END

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
	 	\ | wincmd p | diffthis


" Vim omni completion when typing code
if has("autocmd") && exists("+omnifunc")
    autocmd FileType *
        \ if &omnifunc == "" |
        \   setlocal omnifunc=syntaxcomplete#Complete |
        \ endif
endif

set spelllang=en_gb
set spell
set number
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set path +=$PWD/components/information_services/sim/inc/**
set path +=$PWD/components/information_services/sim/src/server/**
set path +=$PWD/components/information_services/sim/src/plug-ins/services/**
set path +=$PWD/components/information_services/sim/src/plug-ins/xsi/sql/**
set path +=$PWD/components/information_services/sim/src/**
set path +=$PWD/components/information_services/sim/**
set path +=$PWD/**

" White spaces trimming manually through F12 or on file write for
function TrimWhiteSpaces()
    %s/\s\+$//e
    ''
:endfunction
"map <F12> :call TrimWhiteSpaces()<CR>
" deal with white spaces trimming
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
"autocmd BufWinLeave * call clearmatches()
autocmd BufWritePre * :%s/\s\+$//e


let c_space_errors=1
let ruby_space_errors=1
let java_space_errors=1
let python_space_errors=1

" ClearCase comments for checkin/checkout are disabled
let g:ccaseNoComment=1

" easy tag configuration
"let g:easytags_file="$HOME/work/tagfile"
"let g:easytags_include_members=1
"set tags=./.tags;,$HOME/work/tagfile

" Open and close all the three plugins on the same time
nmap <F8>   :TrinityToggleAll<CR>

" Open and close the srcexpl.vim separately
nmap <F9>   :TrinityToggleSourceExplorer<CR>

" Open and close the taglist.vim separately
nmap <F10>  :TrinityToggleTagList<CR>

" Open and close the NERD_tree.vim separately
nmap <F11>  :TrinityToggleNERDTree<CR>

" configure cscope
if has("cscope")
    set cscopetag
    set cscopeverbose
    "call CCTreeLoadDB "cscope.out"
endif
