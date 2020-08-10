export HISTSIZE=5000
export HISTFILESIZE=5000
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
export FZF_DEFAULT_OPTS="--reverse --prompt='λ '"
export FZF_DEFAULT_COMMAND="fd --type f --exclude .git -H"
export FZF_CTRL_T_COMMAND="fd --type f --exclude .git -H"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
export FZF_CTRL_T_OPTS="--preview '(bat {} || tree -C {}) 2> /dev/null | head -200'"
export NVM_DIR="$HOME/.nvm"
export PS1="\[\e[1;3m\]\W\[\e[0m\]\[\e[1;36m\] >\[\e[0m\] "
export EDITOR='nvim'
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
export GPG_TTY=$(tty)
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
export BASH_SILENCE_DEPRECATION_WARNING=1
export PATH="/usr/local/opt/helm@2/bin:$PATH"

source $HOME/.bashrc
