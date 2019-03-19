set encoding=utf-8
scriptencoding utf-8

set nocompatible
let mapleader = ','
let maplocalleader = '\\'

colo gruvbox

set background=dark

filetype plugin indent on
syntax enable

set noshowmode

set backupcopy=yes

set updatetime=100
set timeoutlen=1000
set ttimeoutlen=0

" If file changes outside vim, read it here
set autoread

set history=1000

" Delete comment character when joining commented lines
set formatoptions+=j

" Dont remember some things
set sessionoptions-=options

" Make command-line cmopletion better
set wildmenu
set wildmode=list:longest

set wildignore+=node_modules,target,log,.DS_Store,.git,tmp

" Minimal message information
set shortmess=a
set shortmess+=WcFstToOI

" Dont break words on wrap
set linebreak

" Relative numbers
set number
set relativenumber

" Set search to ignore case when search is all lower
" but recognize upper if specified
set ignorecase
set smartcase

set novisualbell " No blinking.
set noerrorbells " No noise.

" Cursor never touches top or bottom of window
set scrolloff=2

" Different colo when diffing
" au FilterWritePre * if &diff | colorscheme apprentice | endif
" au BufWinLeave * colorscheme gruvbox
" if &diff
"   colorscheme apprentice
" endif

" Backups & Files
"set backup
"set backupdir=~/.vim/backups
set directory=~/.vim/tmp

set nolist

" Disable folding
set nofoldenable

" Add ignorance of whitespace to diff
set diffopt=iwhite

" Hide mouse after while typing
set mousehide

" Mouse in all modes
set mouse=a

" Show matching brackets
"set showmatch

" Highlight searching
"set hlsearch
set incsearch

" Get rid of characters in separators
set fillchars = ""

" Whitespace
set shiftround
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set smarttab
set autoindent
set copyindent
set backspace=indent,eol,start

" Cursor freedom
set virtualedit=all

set laststatus=2

" Show cursor line
set cul

" Enable error files & error jumping.
set cf

" Writes on make/shell commands.
set autowrite

set noruler
set lazyredraw
set synmaxcol=256
set scrolljump=5
set ttyfast
