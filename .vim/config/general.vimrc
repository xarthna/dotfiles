" Numbers set with autocmd

set nocompatible

filetype plugin indent on
syntax enable

set encoding=utf-8
scriptencoding utf-8

let mapleader = ','
let maplocalleader = ','

"# TrueColor
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set guicursor=n-v:block,i-c:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait10-blinkoff150-blinkon175

set background=dark
let g:gruvbox_contrast_dark = 'hard'
colo gruvbox

set signcolumn=no
set iskeyword+=-
set noshowmode
set tildeop
set undofile
set clipboard=unnamedplus
set nobackup
set noswapfile
set updatetime=100
set timeout
set timeoutlen=1000
set ttimeout
set ttimeoutlen=0
set autoread
set history=1000
set formatoptions+=j
set sessionoptions-=options
set wildmenu
set wildmode=list:longest
set wildignore+=node_modules,target,log,.DS_Store,.git,tmp,vendor,tags,.class,.tags
set shortmess=a
set shortmess+=WcFstToOI
set linebreak
set ignorecase
set smartcase
set novisualbell
set noerrorbells
set scrolloff=2
set nolist
set nofoldenable
set diffopt=iwhite
set mousehide
set mouse=a
set showmatch
set incsearch
set fillchars=""
set shiftround
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set smarttab
set autoindent
set copyindent
set backspace=indent,eol,start
set virtualedit=all
set laststatus=2
set cul
set cf
set noruler
set lazyredraw
set synmaxcol=256
set scrolljump=5
set ttyfast
set tags=.tags
