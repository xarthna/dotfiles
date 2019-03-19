export HISTSIZE=5000
export HISTFILESIZE=5000
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
export FZF_DEFAULT_OPTS="--reverse --prompt='λ ' --color=hl:4,hl+:12"
export FZF_DEFAULT_COMMAND="fd --type f --exclude .git -H"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export NVM_DIR="$HOME/.nvm"
export PS1="\u@\h \e[31m[\W]\e[0m "
export EDITOR='vim'
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
export GREP_OPTIONS='--color=always'
export GPG_TTY=$(tty)
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd # Linux like ls colors
#export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx # Miami vice like colors

source $HOME/.bashrc
