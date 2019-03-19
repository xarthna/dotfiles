alias config='/usr/local/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME' # dotfiles git alias watching $HOME
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
alias v="nvim"
alias nv="nvim"
alias n="nvim"
alias vim="nvim"
alias python="python3"
alias gcal="gcalcli"

# Set up autocomplete for aliases
if [ -f $(brew --prefix)/etc/bash_completion.d/git-completion.bash ]; then
  source $(brew --prefix)/etc/bash_completion.d/git-completion.bash
  __git_complete g __git_main
fi

if [ -f /Applications/Docker.app/Contents/Resources/etc/docker-compose.bash-completion ]; then
  source /Applications/Docker.app/Contents/Resources/etc/docker-compose.bash-completion
  complete -F _docker_compose dc
fi

if [ -f /Applications/Docker.app/Contents/Resources/etc/docker-compose.bash-completion ]; then
  source /Applications/Docker.app/Contents/Resources/etc/docker.bash-completion
  complete -F _docker d
fi

if [[ -z $(pgrep gpg-agent) ]]; then
  eval $(gpg-agent --daemon --pinentry-program /usr/local/bin/pinentry)
fi

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
eval "$(rbenv init -)"
