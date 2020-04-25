function! CurrentGitBranch()
 let l:value = substitute(system("git rev-parse --abbrev-ref HEAD"), '\n', '', 'g')
 return matchstr(l:value, 'fatal') == 'fatal' ? '' : ' ' . l:value
endfunction

function! Filetype()
  return empty(&ft) ? '|' : '| ' . &ft . ' |'
endfunction

hi link StatusBg CursorLine
hi LinterOk guifg=#00FF00 guibg=#2c323c
hi LinterWarn guifg=#EAF940 guibg=#2c323c
hi LinterError guifg=#FF0000 guibg=#2c323c
hi Path guifg=#8be9fd guibg=#2c323c
hi ModeOrange guibg=#FE8019 guifg=#262626
hi ModeGreen guibg=#B8BB26 guifg=#262626
hi ModeAqua guibg=#8EC07C guifg=#262626
hi ModeNormal guibg=#EBDBB2 guifg=#262626


function! ModeName()
  let l:currentmode={
      \ 'n'      : ' NORMAL',
      \ 'v'      : ' VISUAL',
      \ 'V'      : ' VISUAL',
      \ "\<C-v>" : ' V•BLOCK',
      \ 'i'      : ' INSERT',
      \ 'R'      : ' REPLACE',
      \ 'c'      : ' COMMAND',
      \ 't'      : ' TERMINAL',
      \ 's'      : ' SNIP'
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
   if exists('b:has_errors') && b:has_errors
     return "%#LinterError#\uf05e "
   elseif exists('b:has_warnings') && b:has_warnings
     return "%#LinterWarn#\uf071 "
   else
     return "%#LinterOk#\uf00c "
   endif
endfunction

function! Status()
  return UpdateMode() . " %#StatusBg#%  %m %#Path#% " . CurrentGitBranch() . "%#StatusBg#%  %= [%b]\ 0x%B | %#Path#%t%#StatusBg# %{Filetype()} %l/%L " . LinterStatus()
endfunction

set stl=%!Status()
