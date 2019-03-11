call plug#begin()
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
  Plug 'scrooloose/nerdcommenter'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'tmux-plugins/vim-tmux-focus-events'
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim' " FZF maintained with homebrew
  Plug 'tpope/vim-fugitive'
  Plug 'w0rp/ale'
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'tpope/vim-rails'
  "Plug 'ervandew/supertab'
  Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'janko-m/vim-test'
  Plug 'itchyny/lightline.vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'maximbaz/lightline-ale'
  Plug 'skywind3000/asyncrun.vim'
  Plug 'tpope/vim-endwise'
  Plug 'machakann/vim-highlightedyank'
  Plug 'junegunn/limelight.vim'
  Plug 'SirVer/ultisnips'
  Plug 'junegunn/gv.vim'
  Plug 'TaDaa/vimade'
  Plug 'junegunn/goyo.vim'
  Plug 'kana/vim-textobj-user'
  Plug 'rhysd/vim-textobj-ruby'
  Plug 'wellle/targets.vim'
  "Plug 'junegunn/vim-slash'
  "Plug 'markonm/traces.vim'
  Plug 'inside/vim-search-pulse'

  " Languages
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'elzr/vim-json'
  Plug 'elixir-lang/vim-elixir'
  Plug 'plasticboy/vim-markdown'
  Plug 'IN3D/vim-raml'
  Plug 'vim-ruby/vim-ruby'
  Plug 'cakebaker/scss-syntax.vim'
  Plug 'stephpy/vim-yaml'
  Plug 'rhysd/vim-crystal'
  Plug 'ekalinin/Dockerfile.vim'

  "Plug 'slashmili/alchemist.vim'
  "Plug 'tpope/vim-bundler'
  "Plug 'tpope/vim-rake'
  "Plug 'tpope/vim-projectionist'
  "Plug 'SirVer/ultisnips'
  "Plug 'honza/vim-snippets'
  "wellle/targets
  "Plug 'christoomey/vim-sort-motion'

  " CLOJURE
  Plug 'kovisoft/paredit', { 'for': 'clojure' }
  Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
  Plug 'venantius/vim-cljfmt', { 'for': 'clojure' }
  Plug 'guns/vim-sexp',    {'for': 'clojure'}
  Plug 'liquidz/vim-iced', {'for': 'clojure'}
  Plug 'luochen1990/rainbow'
  Plug 'guns/vim-clojure-static'
  Plug 'lifepillar/vim-solarized8'
  "Plug 'technomancy/leiningen'
  "Plug vim-unimpaired

  "Plug 'junegunn/rainbow_parentheses.vim'
  "Plug 'tpope/vim-sexp-mappings-for-regular-people'


  """ Colorschemes """

  Plug 'junegunn/seoul256.vim'
  Plug 'nanotech/jellybeans.vim'
  Plug 'morhetz/gruvbox'
  Plug 'mhartington/oceanic-next'
  Plug 'sjl/badwolf'

  "Plug 'romainl/Apprentice'
call plug#end()
