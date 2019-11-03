let s:location_list_is_open = 0

function! s:LocationListToggle() abort
    if s:location_list_is_open == 1
        lclose
        let s:location_list_is_open = 0
    else
        lopen 25
        let s:location_list_is_open = 1
    endif
endfunction

nnoremap <Plug>LocationListToggle
      \ :<C-U>call <SID>LocationListToggle()<CR>

function! s:QuickFixToggle()
  for i in range(1, winnr('$'))
    let bnum = winbufnr(i)
    if getbufvar(bnum, '&buftype') == 'quickfix'
      cclose
      return
    endif
  endfor
  botright copen 25
endfunction

nnoremap <Plug>QuickFixToggle
      \ :<C-U>call <SID>QuickFixToggle()<CR>
