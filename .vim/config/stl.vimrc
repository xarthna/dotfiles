function! Filetype()
  return empty(&ft) ? '|' : '| ' . &ft . ' |'
endfunction

function! ModeName()
  let l:currentmode={
      \ 'n'      : ' NORMAL',
      \ 'v'      : ' VISUAL',
      \ 'V'      : ' VISUAL',
      \ "\<C-v>" : ' V•BLOCK',
      \ 'i'      : ' INSERT',
      \ 'R'      : ' REPLACE',
      \ 'c'      : ' COMMAND',
      \ 't'      : ' TERMINAL'
      \}
 return toupper(l:currentmode[mode()])
endfunction

function! UpdateMode()
  let l:mode = mode()
  let l:color = '%#ModeNormal#'

  if (l:mode =~# '\v(v|V)' || l:mode ==# "\<C-V>")
    let l:color = '%#ModeAqua#'
  elseif (l:mode =~# '\v(R|i)')
    let l:color = '%#ModeGreen#'
  elseif (l:mode =~# '\v(t|c)')
    let l:color = '%#ModeOrange#'
  endif

  return l:color . ModeName()
endfunction

function! LinterStatus()
   let l:counts = ale#statusline#Count(bufnr('%'))
   let l:all_errors = l:counts.error + l:counts.style_error
   let l:all_non_errors = l:counts.total - l:all_errors
   if l:all_errors > 0
     return "%#LinterError#\uf05e "
   elseif l:all_non_errors > 0
     return "%#LinterWarn#\uf071 "
   else
     return "%#LinterOk#\uf00c "
   endif
endfunction

function! Status()
  return UpdateMode() . " %#RedText# %{fugitive#head()}%#StatusBg# %m %= [%b]\ 0x%B | %#RedText#%t%#StatusBg# %{Filetype()} %p%% " . LinterStatus()
endfunction

set stl=%!Status()
