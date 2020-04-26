setlocal iskeyword+=!,?
setlocal keywordprg=:botright\ 20sp\ term://ri

nnoremap <silent><buffer> <leader>T :TestFile<CR>
nnoremap <silent><buffer> <leader>t :TestNearest<CR>

iabbrev <buffer> dbg puts "========================================= #{
iabbrev <buffer> pry binding.pry

let b:testprg='DOCKER_ENV=true ./bin/rspec --require $VIMHOME/quickfix_formatter.rb --format QuickfixFormatter'

function! TestCallback(job_id, data, event)
  if a:event == 'stdout'
    cgetexpr a:data
  end

  if a:event == 'exit'
    if a:data
      call SendRed()
    else
      call SendGreen()
    end
  end
endfunction

function! TestFile(fname)
  let l:callback = {'on_exit': 'TestCallback', 'on_stdout': 'TestCallback', 'stdout_buffered': v:true} 
  call jobstart(b:testprg . ' ' . a:fname, l:callback)
endfunction

function! TestNearest(fname) abort
  let l:callback = {'on_exit': 'TestCallback', 'on_stdout': 'TestCallback', 'stdout_buffered': v:true} 
  let l:alternate = substitute(fnamemodify(a:fname, ':t'), '.rb', '_spec.rb', '')
  let l:path = fnamemodify(a:fname, ':h')
  let l:spec_file = a:fname

  let l:line = 1
  if a:fname =~ '_spec.rb'
    let l:line = line('.')
  else
    let l:buf = getbufinfo(l:alternate)
    if !empty(l:buf)
      let l:line = get(l:buf[0], 'lnum', 1)
      let l:spec_file = l:path . '/' . l:alternate
      echom l:spec_file
      if l:path =~ '^app'
        let l:spec_file = substitute(l:spec_file, 'app', 'spec', '')
      else
        let l:spec_file = substitute(l:spec_file, 'lib', 'spec/lib', '')
      end
    end
  end

  call jobstart(b:testprg . ' ' . l:spec_file . ':' . l:line, l:callback)
endfunction

command! TestNearest call TestNearest(expand('%'))
command! TestFile call TestFile(expand('%'))

au! BufWritePost * call GenerateTags()

setlocal makeprg=rubocop\ --format\ emacs

function! ResetTmuxMessageColor(_)
  call system("tmux set-window-option message-style fg='#8be9fd'")
  call system("tmux set-window-option message-style bg='#44475a'")
endfunction

function! SendGreen()
  let timer = timer_start(3000, 'ResetTmuxMessageColor')

  call system("tmux set-window-option message-style 'bg=#00b300'")
  call system("tmux display-message ''")
endfunction

function! SendRed()
  let timer = timer_start(3000, 'ResetTmuxMessageColor')

  call system("tmux set-window-option message-style 'bg=#FF6666'")
  call system("tmux display-message ''")
endfunction

function! PlaceSign(sname, lnum)
  call sign_place(a:lnum, 'MyLinter', a:sname, bufname('%'), {'lnum': a:lnum})
endfunction

function! RemoveAllSigns()
  call sign_unplace('MyLinter')
endfunction

function! LinterUpdateView(job_id, data, event)
  let b:has_errors = 0
  let b:has_warnings = 0

  call remove(a:data, -1)
  lgetexpr a:data

  call RemoveAllSigns()

  for i in getloclist(0)
    if i.type == 'E'
      let b:has_errors = 1
      call PlaceSign('LinterError', i.lnum)
    else
      let b:has_warnings = 1
      call PlaceSign('LinterWarn', i.lnum)
    endif
  endfor
endfunction

function! UpdateLinterMessage()
  let l:current_item_list = filter(getloclist(0), 'v:val.lnum == line(".")')

  if empty(l:current_item_list)
    echo
  else
    echo l:current_item_list[0].text
  endif
endfunction

function! RunLinter()
  let l:callback = {'on_stdout': 'LinterUpdateView', 'stdout_buffered': v:true} 
  call jobstart(&makeprg . ' ' . expand('<afile>'), l:callback)
endfunction

augroup linting
  autocmd!
  call sign_define('LinterWarn', {'text': '==', 'texthl': 'LinterWarn'})
  call sign_define('LinterError', {'text': '!!', 'texthl': 'LinterError'})
  autocmd! BufWritePost * call RunLinter()
  autocmd! CursorMoved * call UpdateLinterMessage()
augroup END

augroup testing
  au! BufWrite <buffer> call TestNearest(expand('<afile>'))
augroup END

let b:undo_ftplugin = "setlocal iskeyword< keywordprg< makeprg<"
