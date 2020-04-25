call plug#begin()
  " Plug 'pechorin/any-jump.vim'
  " Plug 'plasticboy/vim-markdown'
  Plug 'SirVer/ultisnips'
  Plug 'airblade/vim-gitgutter'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'honza/vim-snippets'
  Plug 'janko-m/vim-test'
  Plug 'junegunn/fzf.vim'
  Plug 'machakann/vim-highlightedyank'
  Plug 'markonm/traces.vim'
  Plug 'michaeljsmith/vim-indent-object'
  Plug 'rhysd/git-messenger.vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'skywind3000/asyncrun.vim'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-projectionist' " maybe eventually extract func you need
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-vinegar'
  Plug 'vim-pandoc/vim-pandoc'
  Plug 'vim-pandoc/vim-pandoc-syntax' 
  Plug 'wellle/targets.vim'
  Plug 'xarthna/vim-plugin-AnsiEsc'

  " CLOJURE
  Plug 'Olical/vim-scheme', { 'for': 'scheme', 'on': 'SchemeConnect' }
  Plug 'guns/vim-sexp', {'for': ['clojure', 'scheme']}
  Plug 'junegunn/rainbow_parentheses.vim'
  Plug 'tpope/vim-fireplace', {'for': 'clojure'}
  Plug 'tpope/vim-sexp-mappings-for-regular-people', {'for': ['clojure', 'scheme']}

  " Colorschemes "
  Plug 'drewtempelmeyer/palenight.vim'
  Plug 'morhetz/gruvbox'
  Plug 'tomasr/molokai'
call plug#end()
