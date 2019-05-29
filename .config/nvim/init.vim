set runtimepath^=~/.vim
let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
let g:ruby_host_prog = '$HOME/.rbenv/shims/neovim-ruby-host'
let g:node_host_prog = '$HOME/.nvm/versions/node/v11.6.0/bin/neovim-node-host'
let &packpath = &runtimepath

source ~/.vimrc
