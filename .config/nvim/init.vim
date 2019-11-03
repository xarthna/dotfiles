let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
let g:ruby_host_prog = '$HOME/.rbenv/shims/neovim-ruby-host'
let g:node_host_prog = '$HOME/.nvm/versions/node/v11.6.0/bin/neovim-node-host'
let &packpath = &runtimepath
let mapleader = ','
let maplocalleader = ','

set nocompatible
filetype plugin indent on
syntax enable

runtime! plug.vim

colo palenight
set termguicolors
set background=dark
set encoding=utf-8
set hidden
set completeopt=menu,menuone,noinsert,noselect
set relativenumber
set signcolumn=yes
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
"set autowrite
set history=1000
set formatoptions=tcqjr
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
set diffopt+=iwhiteeol,indent-heuristic,algorithm:histogram
set mousehide
set mouse=a
set showmatch
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
set guicursor=n-v:block,i-c:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait10-blinkoff150-blinkon175

map Q <nop>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap ]q :cnext<CR>
nnoremap [q :cprev<CR>
nnoremap ]l :lnext<CR>
nnoremap [l :lprev<CR>
nnoremap <leader>u <C-t>
nnoremap <leader>d <C-]>
nnoremap <leader>bb :b#<CR>
nnoremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
cnoremap <C-j> <C-n>
cnoremap <C-k> <C-p>
nnoremap <silent><space> :nohlsearch<Bar>:echo<CR>
nnoremap <leader>h :tab h<space>
nnoremap ' `
nnoremap / /\v
vnoremap / /\v
nmap <silent> <leader><leader> <Plug>QuickFixToggle
nmap <silent> <leader>l <Plug>LocationListToggle
inoremap <special><expr> <Esc>[200~ XTermPasteBegin()
" TODO: update on write
nmap <silent> <leader>om <Plug>OpenMarkdownPreview
nmap <silent> <leader>op <Plug>OpenPandocPreview
noremap <silent><leader>V :edit $HOME/.config/nvim/init.vim<CR>
" below messes with digraphs
"inoremap <C-j> <C-n>
"inoremap <C-k> <C-p>

iabbrev #d '========================================='

hi link HighlightedyankRegion PmenuSel
hi! link IncSearch PmenuSel
hi! link Search PmenuSel
hi! link DiffChange PmenuSel
hi! link DiffText Directory
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$' " Show git merge error markers

" Test runners  with ansi color escape happens in quickfix
" FIXME: Reseting style overrides from hi.vim
"au FileType qf :AnsiEsc
