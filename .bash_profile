#source ~/.bin/tmuxinator.bash
#source ~/.bashrc
stty stop undef

# use this alias instead of normal git to work with your dotfiles
# instead of using the .git folder it uses the .cfg folder with your
# working directory as $HOME

alias config='/usr/local/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ls="ls -FG"
alias ll="ls -lhaFG"
alias g="git"
alias murder="kill"
alias rampage="killall"
alias dds="find . -name ‘*.DS_Store’ -type f -delete"
alias gem-implode='for x in `gem list --no-versions`; do gem uninstall $x -a -x -I; done'
alias gst='git status -sb'
alias be="bundle exec"
alias d="docker"
alias dc="docker-compose"
alias dcfg="docker-compose logs -f"
alias drmac="docker rm $(docker ps -a -q)"
alias devt="docker exec virtual_terminal"
alias dcg="docker-compose -f docker-compose-groups.yml"
alias v="vim"

# Set up autocomplete for aliases
complete -F _docker_compose dc
complete -F _docker d

#alias ss="tmux capture-pane -pS -32768 |fzf --height 40% --reverse --bind 'enter:execute-silent(echo {} | pbcopy)+abort'"
alias ss="tmux capture-pane -pS -32768 |fzf --bind \"ctrl-y:execute-silent(echo {} | pbcopy)+abort,ctrl-a:execute-silent(echo {} |yank)\" --height 40% --reverse --color=hl+:#ff0000 |yank |xargs echo"
bind '"\C-s": ss'

#bind '"\C-s": " \C-e\C-u\C-y\ey\C-u`tmux capture-pane -pS -32768 |fzf --bind \"ctrl-y:execute-silent(echo {} | pbcopy)+abort,ctrl-a:execute-silent(echo {} |yank)\" --height 40% --reverse --color=hl+:#ff0000 |yank`\e\C-e\er\e^"'
#bind '"\C-s": " \C-e\C-u\C-y\ey\C-u`tmux capture-pane -pS -32768 |fzf --bind \"ctrl-y:execute-silent(echo {} | pbcopy)+abort,ctrl-a:execute-silent(echo {} |yank)\" --height 40% --reverse --color=hl+:#ff0000 |yank`\e\C-e^"'

if [ -f $(brew --prefix)/etc/bash_completion.d/git-completion.bash ]; then
  source $(brew --prefix)/etc/bash_completion.d/git-completion.bash
  __git_complete g __git_main
fi

export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
export FZF_DEFAULT_OPTS="--reverse --prompt='λ '"
export FZF_DEFAULT_COMMAND="fd --type f --exclude .git -H"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export HISTSIZE=5000
export HISTFILESIZE=5000
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

# More miami vice like colors
#export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
# Linux like ls colors
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
export GPG_TTY=$(tty)

if [[ -z $(pgrep gpg-agent) ]]; then
  eval $(gpg-agent --daemon --pinentry-program /usr/local/bin/pinentry)
fi

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
eval "$(rbenv init -)"
