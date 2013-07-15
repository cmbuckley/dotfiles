" Make Vim more useful
"set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
"set clipboard=unnamed
" Enhance command-line completion
"set wildmenu
" Allow cursor keys in insert mode
"set esckeys
" Allow backspace in insert mode
"set backspace=indent,eol,start
" Optimize for fast terminal connections
"set ttyfast
" Add the g flag to search/replace by default
"set gdefault
" Use UTF-8 without BOM
"set encoding=utf-8 nobomb
" Change mapleader
"let mapleader=","
" Respect modeline in files
"set modeline
"set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
"set exrc
"set secure
" Enable line numbers
set number

if &diff
    syntax off
else
    " Enable syntax highlighting
    syntax on
endif

" Unix line endings
"set fileformats=unix
" Make tabs as wide as 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent
set autoindent
" Show “invisible” characters
"set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
"set list
" Ignore case of searches
set ignorecase
" Except if mixed case is used
set smartcase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
"set laststatus=2
" Enable mouse in all modes
"set mouse=a
" Disable error bells
"set noerrorbells
" Don’t reset cursor to start of line when moving around.
"set nostartofline
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
"set showmode
" Show the filename in the window titlebar
"set title
" Show the (partial) command as it’s being typed
"set showcmd
" Start scrolling before the horizontal window border
set scrolloff=7
" Backups
set nobackup
set nowb
set noswapfile
set autoread

" Commands
command Sw  :execute ':silent w !sudo tee % > /dev/null' | :edit!
command Wq  wq
command Wqa wqa
command WQa wqa
command W   w
command Q   q
command Qa  qa
command Vsp vsp

if !&diff
    " Save actions
    autocmd BufWritePre * :%s/\s\+$//e
    autocmd BufWritePre * :%s/\r//e
    "autocmd BufWritePre *.awk,*.css,*.csv,*.ini,*.js,*.json,*.php,*.phtml,*.sh,*.svg,*.txt,*.xml,*.xsd,*.yaml :%s/	/    /ge
endif

" Plugins
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
"call pathogen#helptags()

"map <space> :NERDTreeToggle \| :silent NERDTreeMirror<CR>
":autocmd FileType php nnoremap <C-L> :!php -l %<CR>
":autocmd FileType php inoremap <C-L> <ESC>:!php -l %<CR>i
":autocmd FileType php inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
":autocmd FileType php nnoremap <C-P> :call PhpDocSingle()<CR>
":autocmd FileType php vnoremap <C-P> :call PhpDocRange()<CR>
