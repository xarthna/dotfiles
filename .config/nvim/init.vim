" global mark V set here
let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
let g:ruby_host_prog = '$HOME/.rbenv/shims/neovim-ruby-host'
let g:node_host_prog = '$HOME/.nvm/versions/node/v12.7.0/bin/neovim-node-host'




let g:os = system('uname -s')
let g:isMac = v:false
let g:isLinux = v:false

if g:os == 'Darwin'
  let g:isMac = v:true
else
  let g:isLinux = v:true
endif

let mapleader = ','
let maplocalleader = "\<space>"
let $VIMHOME=expand('<sfile>:p:h')

runtime! plug.vim
runtime! plugin/colors.vim

syntax enable
filetype plugin indent on
set termguicolors

set background=dark

colo palenight

set clipboard=unnamedplus
set completeopt=menu,menuone,noinsert,noselect
set confirm
set copyindent
set cursorline
set diffopt+=iwhiteeol,indent-heuristic,algorithm:histogram
set errorformat^=%f:%l:%c:\ %t:%m
set expandtab
set guicursor=n-v:block,i-c:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait10-blinkoff150-blinkon175
set hidden
set history=1000
set inccommand=nosplit
set lazyredraw
set mouse=a
set nobackup
set nofoldenable
set nohlsearch
set noruler
set noshowmode
set noswapfile
set nottimeout
set relativenumber
set runtimepath+=/usr/local/opt/fzf
set scrolloff=2
set shiftround
set shiftwidth=2
set shortmess=aWcFstToOI
set showmatch
set signcolumn=yes
set smartindent
set softtabstop=2
set synmaxcol=512
set tabstop=2
set tags=.tags
set undofile
set updatetime=1000
set virtualedit=all
set wildignore+=node_modules,target,log,.DS_Store,.git,tmp,vendor,tags,.class,.tags,vendor
set wildmode=list:longest

cnoremap <C-j> <C-n>
cnoremap <C-k> <C-p>
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
inoremap <expr> <esc> pumvisible() ? "\<C-e>" : "\<esc>"
inoremap <special><expr> <Esc>[200~ XTermPasteBegin()
map Q <nop>
nnoremap <silent> <C-n> :Exp<CR>
nmap <silent> <localleader>l <Plug>LocationListToggle
nmap <silent> <localleader>q <Plug>QuickFixToggle
nnoremap ' `
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-b> :b#<CR>
nnoremap qq :x<CR>
nnoremap <localleader>w :w<CR>
nnoremap <localleader>h :tab h<space>
nnoremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap [B :bfirst<CR>
nnoremap [Q :cfirst<CR>
nnoremap [a :prev<CR>
nnoremap [b :bprev<CR>
nnoremap [l :lprev<CR>
nnoremap [q :cprev<CR>
nnoremap [t :tprev<CR>
nnoremap ]B :blast<CR>
nnoremap ]L :last<CR>
nnoremap ]L :lfirst<CR>
nnoremap ]Q :clast<CR>
nnoremap ]a :next<CR>
nnoremap ]b :bnext<CR>
nnoremap ]l :lnext<CR>
nnoremap ]q :cnext<CR>
nnoremap ]t :tnext<CR>
nnoremap N Nzz
nnoremap n nzz
inoremap <expr><tab> (pumvisible() ? "\<C-n>" : "\<tab>")
inoremap <expr><S-tab> (pumvisible() ? "\<C-p>" : "\<S-tab>")
"vnoremap / /\v
"nnoremap / /\v

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

