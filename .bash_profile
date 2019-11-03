export HISTSIZE=5000
export HISTFILESIZE=5000
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
export FZF_DEFAULT_OPTS="--ansi --color=hl:4,hl+:12 --reverse --prompt='λ '"
export FZF_DEFAULT_COMMAND="fd --type f --exclude .git -H"
export FZF_CTRL_T_COMMAND="fd --type f --exclude .git -H"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export NVM_DIR="$HOME/.nvm"
export PS1="me@\h \[\e[31m\][\W]\[\e[0m\] "
export EDITOR='vim'
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
export GPG_TTY=$(tty)
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd # Linux like ls colors
export MANPAGER="nvim +set\ filetype=man -"
#export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx # Miami vice like colors
# TERM=xterm-256color-italic # getting italics in tmux/iterm/vim
source $HOME/.bashrc

