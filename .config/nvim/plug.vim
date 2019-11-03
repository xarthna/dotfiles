call plug#begin()
  Plug 'natebosch/vim-lsc'
  Plug '/usr/local/opt/fzf' " FZF maintained with homebrew
  Plug 'airblade/vim-gitgutter'
  Plug 'ajh17/VimCompletesMe'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'janko-m/vim-test'
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/gv.vim'
  Plug 'kana/vim-textobj-user'
  Plug 'machakann/vim-highlightedyank'
  Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
  Plug 'mbbill/undotree'
  Plug 'powerman/vim-plugin-AnsiEsc'
  Plug 'rhysd/clever-f.vim'
  Plug 'rhysd/git-messenger.vim'
  Plug 'rhysd/vim-textobj-ruby'
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
  Plug 'sheerun/vim-polyglot'
  Plug 'skywind3000/asyncrun.vim'
  Plug 'tmux-plugins/vim-tmux-focus-events'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-projectionist'
  Plug 'tpope/vim-rails', {'for': 'ruby'}
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'w0rp/ale'
  Plug 'wellle/targets.vim'
  Plug 'voldikss/vim-floaterm'
  Plug 'pbrisbin/vim-mkdir'
  Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
  Plug 'jkramer/vim-checkbox'
  Plug 'michaeljsmith/vim-indent-object'
  Plug 'godlygeek/tabular'
  Plug 'junegunn/limelight.vim'
  Plug 'junegunn/goyo.vim'
  Plug 'vim-pandoc/vim-pandoc'
  Plug 'vim-pandoc/vim-pandoc-syntax'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'

  "Plug 'scrooloose/vim-slumlord'
  "Plug 'markonm/traces.vim'
  "Plug 'mlaursen/vim-react-snippets'

  " CLOJURE
  Plug 'guns/vim-sexp',    {'for': 'clojure'}
  "Plug 'liquidz/vim-iced', {'for': 'clojure'}
  Plug 'luochen1990/rainbow', { 'for': 'clojure' }
  Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
  Plug 'venantius/vim-cljfmt', { 'for': 'clojure' }
  Plug 'tpope/vim-sexp-mappings-for-regular-people', {'for': 'clojure'}

  " Colorschemes "
  Plug 'morhetz/gruvbox'
  Plug 'arzg/vim-corvine'
  Plug 'drewtempelmeyer/palenight.vim'
  Plug 'ayu-theme/ayu-vim'
  Plug 'mhartington/oceanic-next'
  Plug 'rakr/vim-one'
  Plug 'arcticicestudio/nord-vim'
  Plug 'sainnhe/gruvbox-material'
  Plug 'bluz71/vim-moonfly-colors'
  Plug 'romainl/Apprentice'
call plug#end()
