set encoding=utf-8
scriptencoding utf-8

set nocompatible
let mapleader = ','
let maplocalleader = '\\'

colo gruvbox

set background=dark

filetype plugin indent on
syntax enable

" modelines are comments in files that set behavior
" e.g. /* vim: set ts=8 sw=4 tw=0 noet : */
set nomodeline

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
"au FilterWritePre * if &diff | colorscheme apprentice | endif
"au BufWinLeave * colorscheme gruvbox
"if &diff
"  colorscheme apprentice
"endif

" Backups & Files
set backup
set backupdir=~/.vim/backups
set directory=~/.vim/tmp

" Was trying to get this to work with filetype "help" and BufEnter and wasnt working
" I think filetype detection happens at diff event lifecycle. Switched filetype to "text"
" and event to BufRead
let ftToIgnore = ["text", "gitcommit", "help"]
"autocmd BufRead,InsertLeave * if index(ftToIgnore, &ft) < 0 | match Error /\t\|\s\+$/
autocmd BufNewFile,InsertLeave * if !&readonly | match Error /\t\|\s\+$/
autocmd InsertEnter * match none

" Dont break words on wrap. Cant use with list option set :(
" set linebreak

" Lets not listchars get in the way of my typing
autocmd BufEnter,BufNewFile,InsertLeave * if !&ro | set list | set listchars=tab:~~,trail:\ ,extends:>,precedes:<,nbsp:+ | else | set nolist | endif
autocmd InsertEnter * set nolist

" Disable folding
set nofoldenable

" Add ignorance of whitespace to diff
set diffopt=iwhite

" Hide mouse after while typing
set mousehide

" Mouse in all modes
set mouse=a

" Show matching brackets
set showmatch

" Highlight searching
"set hlsearch
"set incsearch

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

" Show cursor column
"set cuc

" Enable error files & error jumping.
set cf

" Writes on make/shell commands.
set autowrite

" No ruler, shows in status.
set noruler

" Set the status line the way I like it
set stl=

" Full path file
"set stl+=\ %F
" Filetype
"set stl+=\ %y
" Modified?
"set stl+=%m
" Readonly?
"set stl+=%r
" Align right
"set stl+=%=
" Current line out of total lines, include percentage
"set stl+=\ Line:%l/%L[%p%%]
" Virtual Column
"set stl+=\ Col:%v
" Buffer
"set stl+=\ Buf:%n
" Ascii and Hex byte
"set stl+=\ [%b][0x%B]

"change terminal title
"set title

" These command open folds
"set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" PERFORMANCE

" Scrolling was very slow for certain files with
" syntax on and a lot going on. This solved issue
set lazyredraw

" Dont syntax highlight past certain col
set synmaxcol=512

" Faster scrolling
set ttyfast
