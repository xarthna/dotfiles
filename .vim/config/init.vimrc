call plug#begin()
  Plug '/usr/local/opt/fzf' " FZF maintained with homebrew
  Plug 'airblade/vim-gitgutter'
  Plug 'ajh17/VimCompletesMe'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'janko-m/vim-test'
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/gv.vim'
  Plug 'kana/vim-textobj-user'
  Plug 'ludovicchabant/vim-gutentags'
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
	"Plug 'blindFS/vim-taskwarrior'
  "Plug 'vim-pandoc/vim-pandoc'
  "Plug 'vim-pandoc/vim-pandoc-syntax'
  "Plug 'xuhdev/vim-latex-live-preview'
  "Plug 'scrooloose/vim-slumlord'
  "Plug 'markonm/traces.vim'
  "Plug 'SirVer/ultisnips'

  " CLOJURE
  Plug 'guns/vim-sexp',    {'for': 'clojure'}
  Plug 'liquidz/vim-iced', {'for': 'clojure'}
  Plug 'luochen1990/rainbow', { 'for': 'clojure' }
  Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
  Plug 'venantius/vim-cljfmt', { 'for': 'clojure' }
  "Plug 'kovisoft/paredit', { 'for': 'clojure' }
  "Plug 'technomancy/leiningen'
  "Plug vim-unimpaired
  "Plug 'junegunn/rainbow_parentheses.vim'
  "Plug 'tpope/vim-sexp-mappings-for-regular-people'

  """ Colorschemes """
  Plug 'morhetz/gruvbox'
call plug#end()
