call plug#begin()
  Plug 'SirVer/ultisnips'
  Plug 'airblade/vim-gitgutter'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'honza/vim-snippets'
  Plug 'junegunn/fzf.vim'
  "Plug 'michaeljsmith/vim-indent-object'
  Plug 'rhysd/git-messenger.vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-projectionist'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'wellle/targets.vim'
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/limelight.vim'
  Plug 'lambdalisue/fern.vim'

  " CLOJURE
  Plug 'Olical/vim-scheme', { 'for': 'scheme', 'on': 'SchemeConnect' }
  Plug 'guns/vim-sexp', {'for': ['clojure', 'scheme']}
  Plug 'junegunn/rainbow_parentheses.vim'
  Plug 'tpope/vim-fireplace', {'for': 'clojure'}
  Plug 'tpope/vim-sexp-mappings-for-regular-people', {'for': ['clojure', 'scheme']}

  " Colorschemes "
  Plug 'chuling/ci_dark'
  Plug 'branwright1/salvation-vim'
  Plug 'aonemd/kuroi.vim' 
  "Plug 'drewtempelmeyer/palenight.vim'
  "Plug 'morhetz/gruvbox'
call plug#end()
