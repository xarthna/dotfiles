function! ResetTmuxMessageColor(_)
  :call system("tmux set-window-option message-style fg='#8be9fd'")
  :call system("tmux set-window-option message-style bg='#44475a'")
endfunction

function! SendGreen()
  :call system("tmux set-window-option message-style 'bg=#00b300'")
  :call system("tmux display-message ''")
  let timer = timer_start(3000, 'ResetTmuxMessageColor')
endfunction

function! SendRed()
  :call system("tmux set-window-option message-style 'bg=#FF6666'")
  :call system("tmux display-message ''")
  let timer = timer_start(3000, 'ResetTmuxMessageColor')
endfunction

let s:rspec_cmd = 'RAILS_ENV=test DOCKER_ENV=true NODE_ENV=test RUBYOPT="-W0" ./bin/rspec --tty --color --require $HOME/quickfix_formatter.rb --format QuickfixFormatter'
let g:test#strategy = "asyncrun"
let g:test#ruby#rspec#executable = s:rspec_cmd
let g:test#javascript#jest#executable = './node_modules/.bin/jest'
let g:asyncrun_exit = "if g:asyncrun_status == 'success' | call SendGreen() | else | call SendRed() | endif"

function! ToggleTestStrategy()
  if(g:test#strategy == "asyncrun")
    let g:test#strategy = "neovim"
  else
    let g:test#strategy = "asyncrun"
  endif
endfunction

command! ToggleTestStrategy call ToggleTestStrategy()
