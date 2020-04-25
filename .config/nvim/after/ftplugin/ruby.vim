setlocal foldmethod=expr
setlocal foldexpr=getline(v:lnum)=~'^\\s*#'
setlocal iskeyword+=!,?
setlocal keywordprg=:botright\ 20sp\ term://ri

nnoremap <silent><buffer> <leader>T :TestFile<CR>
nnoremap <silent><buffer> <leader>t :TestNearest<CR>

iabbrev <buffer> dbg puts "========================================= #{
iabbrev <buffer> pry binding.pry

au! BufWrite <buffer> if test#exists() | TestNearest | endif
au! BufWritePost * call GenerateTags()

execute "normal zM``"

setlocal makeprg=rubocop\ --format\ emacs

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

let b:undo_ftplugin = "setlocal foldmethod< foldexpr< iskeyword< keywordprg< makeprg<"
