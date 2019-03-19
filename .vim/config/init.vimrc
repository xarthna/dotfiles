call plug#begin()

  Plug 'airblade/vim-gitgutter'
  Plug 'christoomey/vim-sort-motion'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'inside/vim-search-pulse'
  Plug 'itchyny/lightline.vim'
  Plug 'janko-m/vim-test'
  Plug '/usr/local/opt/fzf' " FZF maintained with homebrew
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/gv.vim'
  Plug 'junegunn/limelight.vim'
  Plug 'kana/vim-textobj-user'
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'machakann/vim-highlightedyank'
  Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
  Plug 'maximbaz/lightline-ale'
  Plug 'rhysd/vim-textobj-ruby'
  Plug 'scrooloose/nerdcommenter'
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
  Plug 'skywind3000/asyncrun.vim'
  Plug 'TaDaa/vimade'
  Plug 'tmux-plugins/vim-tmux-focus-events'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'w0rp/ale'
  Plug 'wellle/targets.vim'
  "Plug 'vim-scripts/AnsiEsc.vim'
  Plug 'tpope/vim-projectionist'

  "Plug 'ervandew/supertab'
  "Plug 'markonm/traces.vim'
  "Plug 'SirVer/ultisnips'

  " Languages
  Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
  Plug 'ekalinin/Dockerfile.vim', { 'for': 'Dockerfile' }
  Plug 'elixir-lang/vim-elixir', { 'for': 'javascript' }
  Plug 'elzr/vim-json', { 'for': 'json' }
  Plug 'mxw/vim-jsx', { 'for': 'javascript' }
  Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
  Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
  Plug 'rhysd/vim-crystal', { 'for': 'crystal' }
  Plug 'stephpy/vim-yaml', { 'for': 'yaml' }
  Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }

  "Plug 'slashmili/alchemist.vim'
  "Plug 'tpope/vim-bundler'
  "Plug 'tpope/vim-rake'
  "Plug 'tpope/vim-projectionist'
  "Plug 'honza/vim-snippets'

  " CLOJURE
  Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
  Plug 'guns/vim-sexp',    {'for': 'clojure'}
  Plug 'kovisoft/paredit', { 'for': 'clojure' }
  Plug 'liquidz/vim-iced', {'for': 'clojure'}
  Plug 'luochen1990/rainbow', { 'for': 'clojure' }
  Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
  Plug 'venantius/vim-cljfmt', { 'for': 'clojure' }

  "Plug 'lifepillar/vim-solarized8'
  "Plug 'technomancy/leiningen'
  "Plug vim-unimpaired
  "Plug 'junegunn/rainbow_parentheses.vim'
  "Plug 'tpope/vim-sexp-mappings-for-regular-people'


  """ Colorschemes """
  Plug 'morhetz/gruvbox'
  "Plug 'junegunn/seoul256.vim'
  "Plug 'nanotech/jellybeans.vim'
  "Plug 'mhartington/oceanic-next'
  "Plug 'sjl/badwolf'
  "Plug 'romainl/Apprentice'
call plug#end()
