augroup WindowManagement
  autocmd!
  autocmd BufWinEnter,WinEnter term://* startinsert
  autocmd TermOpen * setlocal nonumber norelativenumber nocul winhighlight=Normal:ActiveTerminal
  autocmd FileType fzf setlocal winhighlight=Normal:Normal
augroup END

augroup terminal_settings
  autocmd!

  autocmd BufWinEnter,WinEnter term://* startinsert
  autocmd BufLeave term://* stopinsert

  " Ignore various filetypes as those will close terminal automatically
  autocmd TermClose term://*
        \ if (expand('<afile>') !~ "fzf") |
        \   call nvim_input('<CR>')  |
        \ endif
augroup END

function! OpenInitialTerminal()
  :sp
  :term
  resize -10
  exe "normal i"
endfunction

function! GetTerminalBuffer()
  return get(filter(copy(getbufinfo()), 'has_key(v:val.variables, "terminal_job_id")'), 0, 0)
endfunction

function! IsTerminalInitialized(buffer)
  let l:dict_type = 4
  return type(a:buffer) == l:dict_type
endfunction

function! ToggleTerminal()
  let l:buffer = GetTerminalBuffer()

  if IsTerminalInitialized(l:buffer)
    let l:buf_nr = l:buffer.bufnr
    let l:win_nr = bufwinnr(l:buf_nr)
    let l:is_hidden = l:buffer.hidden

    if l:is_hidden
      exe 'sb' l:buf_nr
      resize -10
    else
      exe l:win_nr . 'hide'
    endif
  else
    call OpenInitialTerminal()
  endif
endfunction

" Want esc to work with fzf still to close out
tnoremap <C-v><esc> <C-\><C-n> 
tnoremap <expr> <C-j> &ft == 'fzf' ? "\<C-j>" : "\<C-\>\<C-n>\<C-w>j"
tnoremap <expr> <C-k> &ft == 'fzf' ? "\<C-k>" : "\<C-\>\<C-n>\<C-w>k"
tnoremap <expr> <C-h> &ft == 'fzf' ? "\<C-h>" : "\<C-\>\<C-n>\<C-w>h"
tnoremap <expr> <C-l> &ft == 'fzf' ? "\<C-l>" : "\<C-\>\<C-n>\<C-w>l"
tnoremap <silent> <C-t> <C-\><C-n>:call ToggleTerminal()<CR>
noremap <silent> <C-t> :call ToggleTerminal()<CR>


