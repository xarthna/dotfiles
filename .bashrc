alias cfg="$(command -v git) --git-dir=$HOME/.cfg/ --work-tree=$HOME" # dotfiles git alias watching $HOME
alias ..="cd .."
alias ....="cd ../.."
alias ls="ls -FG"
alias lh="ls -ld .?*"
alias ll="ls -lhaFG"
alias g="git"
alias be="bundle exec"
alias d="docker"
alias dc="docker-compose"
alias f="fg"
alias v="nvim"
alias vim="nvim"
alias _vim="vim"
alias python="python3"
alias gcal="gcalcli"
alias ts='date "+%Y-%m-%d"'
#alias ag='ag --path-to-ignore ~/.ignore'
alias lsv="ls|fzf --preview '[ -d {} ] && tree -C {}|head -200 || cat {}'"
alias k="kubectl"
alias ssh="TERM=xterm ssh "

if [ -f ~/.privaterc ]; then
  source ~/.privaterc
fi

# Set up autocomplete for aliases
if [[ $(uname -s) == 'Darwin' ]]; then
  source /usr/local/etc/bash_completion.d/git-completion.bash
  __git_complete g __git_main

  source /Applications/Docker.app/Contents/Resources/etc/docker-compose.bash-completion
  complete -F _docker_compose dc

  source /Applications/Docker.app/Contents/Resources/etc/docker.bash-completion
  complete -F _docker d
fi

if [[ -z $(pgrep gpg-agent) ]]; then
  eval $(gpg-agent --daemon --pinentry-program /usr/bin/pinentry)
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export PS1="\[\e[1;3m\]\W\[\e[0m\]\[\e[1;34m\] >\[\e[0m\]\[\e[1;35m\]>\[\e[0m\]\[\e[1;38;5;214m\]>\[\e[0m\] "

function motd() {
  local IFS=$'\n'
  local msgs=('C-f  Move forward char'
              'M-f  Move forward char'
              'C-b  Move backward char'
              'M-b  Move backward word'
              'C-p  Move up'
              'C-n  Move down'
              'C-a  Jump to beginning of line'
              'C-e  Jump to end of line'
              'C-d  Delete forward char'
              'M-d  Delete forward word'
              'del  Delete backward char'
              'M-b  Delete backward word'
              'C-u  Delete entire line'
              'M-k  Custom - delete forward to end of line'
              'M-l  Custom - delete forward to end of line')

  printf "\033[0;90m"

  for s in ${msgs[@]}; do
    printf "$s\n"
  done

  printf "\033[0m\n"
}

motd

if [ $(command -v rbenv) ]; then
  eval "$(rbenv init -)"
fi

if [ $(command -v nodenv) ]; then
  eval "$(nodenv init -)"
fi

if [ $(command -v jenv) ]; then
  eval "$(jenv init -)"
fi

