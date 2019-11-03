" TODO: if guard

function! ResetTmuxMessageColor(_)
  :call system("tmux set-window-option message-style fg=colour0")
  :call system("tmux set-window-option message-style bg=colour251")
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

function! InteractiveStrategy(cmd)
  :call system("tmux split-window -v " . a:cmd . " ; tmux resize-pane -y 30")
endfunction

"let s:rspec_cmd = 'docker exec -e RAILS_ENV=test -e DOCKER_ENV=true -e NODE_ENV=test -e RUBYOPT="-W0" virtual_terminal ./bin/rspec --color --format progress'
let s:rspec_cmd = 'docker exec -e RAILS_ENV=test -e DOCKER_ENV=true -e NODE_ENV=test -e RUBYOPT="-W0" virtual_terminal ./bin/rspec --color --require /root/quickfix_formatter.rb --format QuickfixFormatter'
let g:test#custom_strategies = {'interactive': function('InteractiveStrategy')}
let g:test#strategy = "asyncrun"
let g:test#ruby#rspec#executable = s:rspec_cmd
let g:test#javascript#jest#executable = 'docker exec virtual_terminal ./node_modules/.bin/jest'
let g:asyncrun_exit = "if g:asyncrun_status == 'success' | call SendGreen() | else | call SendRed() | endif"

function! ToggleTestStrategy()
  if(g:test#strategy == "asyncrun")
    let g:test#strategy = "interactive"
  else
    let g:test#strategy = "asyncrun"
  endif
endfunction

command! ToggleTestStrategy call ToggleTestStrategy()

function! ResetTmuxMessageColor(_)
  :call system("tmux set-window-option message-style fg=colour0")
  :call system("tmux set-window-option message-style bg=colour251")
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

function! InteractiveStrategy(cmd)
  :call system("tmux split-window -v " . a:cmd . " ; tmux resize-pane -y 30")
endfunction

"let s:rspec_cmd = 'docker exec -e RAILS_ENV=test -e DOCKER_ENV=true -e NODE_ENV=test -e RUBYOPT="-W0" virtual_terminal ./bin/rspec --color --format progress'
let s:rspec_cmd = 'docker exec -e RAILS_ENV=test -e DOCKER_ENV=true -e NODE_ENV=test -e RUBYOPT="-W0" virtual_terminal ./bin/rspec --color --require /root/quickfix_formatter.rb --format QuickfixFormatter'
let g:test#custom_strategies = {'interactive': function('InteractiveStrategy')}
let g:test#strategy = "asyncrun"
let g:test#ruby#rspec#executable = s:rspec_cmd
let g:test#javascript#jest#executable = 'docker exec virtual_terminal ./node_modules/.bin/jest'
let g:asyncrun_exit = "if g:asyncrun_status == 'success' | call SendGreen() | else | call SendRed() | endif"

function! ToggleTestStrategy()
  if(g:test#strategy == "asyncrun")
    let g:test#strategy = "interactive"
  else
    let g:test#strategy = "asyncrun"
  endif
endfunction

command! ToggleTestStrategy call ToggleTestStrategy()
