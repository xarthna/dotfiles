" global mark V set here
let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
let g:ruby_host_prog = '$HOME/.rbenv/shims/neovim-ruby-host'
let g:node_host_prog = '$HOME/.nvm/versions/node/v12.7.0/bin/neovim-node-host'
let mapleader = ','
let maplocalleader = "\<space>"

set nocompatible
filetype plugin indent on
syntax enable

set runtimepath+=/usr/local/opt/fzf

" vim invokes subshell for external commmands. These options make it sane for
" things like **/*
"set shell+=\ -O\ globstar
"set shell+=\ -O\ extglob

runtime! plug.vim
runtime! plugin/color_overrides.vim

colo molokai
set confirm
set termguicolors
set background=dark
set encoding=utf-8
set hidden
set completeopt=menu,menuone,noinsert,noselect
set number
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
set nohlsearch
set incsearch
set history=1000
set sessionoptions-=options
set wildmenu
set wildmode=list:longest
set wildignore+=node_modules,target,log,.DS_Store,.git,tmp,vendor,tags,.class,.tags,vendor
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
set synmaxcol=512
set inccommand=split
set scrolljump=5
set ttyfast
set tags=.tags
set guicursor=n-v:block,i-c:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait10-blinkoff150-blinkon175

map Q <nop>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>x :x<CR>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap ]a :next<CR>
nnoremap [a :prev<CR>
nnoremap ]t :tnext<CR>
nnoremap [t :tprev<CR>
nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>
nnoremap ]q :cnext<CR>
nnoremap [q :cprev<CR>
nnoremap ]L :lfirst<CR>
nnoremap ]L :last<CR>
nnoremap ]l :lnext<CR>
nnoremap [l :lprev<CR>
nnoremap ]b :bnext<CR>
nnoremap [b :bprev<CR>
nnoremap [B :bfirst<CR>
nnoremap ]B :blast<CR>
nnoremap <leader><C-d> <C-t>
nnoremap <leader>d <C-]>
nnoremap <leader>b :b#<CR>
nnoremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
cnoremap <C-j> <C-n>
cnoremap <C-k> <C-p>
nnoremap <leader>h :tab h<space>
nnoremap ' `
nnoremap / /\v
vnoremap / /\v
nmap <silent> <localleader><localleader> <Plug>QuickFixToggle
nmap <silent> <leader>l <Plug>LocationListToggle
inoremap <special><expr> <Esc>[200~ XTermPasteBegin()
" TODO: update on write?
"nmap <silent> <leader>om <Plug>OpenMarkdownPreview
"nmap <silent> <leader>op <Plug>OpenPandocPreview
inoremap <expr> <esc> pumvisible() ? "\<C-e>" : "\<esc>"
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
autocmd FileType * set fo-=j fo-=l fo-=o fo+=t
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
noremap <leader>n nzz
noremap <leader>N Nzz
noremap \ ,
"nmap <tab> %

match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$' " Show git merge error markers

autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif

let g:scheme_executable = "$HOME/bin/scheme.sh"

function! SchemeConnectWrapper()
  :SchemeConnect
  exe "normal \<C-w>L"
  vert resize -50
  exe "normal \<C-w>h"
endfunction

command! SConnect call SchemeConnectWrapper()
command! Abort :cq<CR>
command! Please :w !sudo tee %<CR>

function! Syn()
  for id in synstack(line("."), col("."))
    echo synIDattr(id, "name")
  endfor
endfunction
command! -nargs=0 Syn call Syn()

augroup terminal_settings
  autocmd!

  autocmd BufWinEnter,WinEnter term://* startinsert
  autocmd BufLeave term://* stopinsert

  " Ignore various filetypes as those will close terminal automatically
  autocmd TermClose term://*
        \ if (expand('<afile>') !~ "fzf") |
        \   call nvim_input('<CR>')  |
        \ endif
augroup END
