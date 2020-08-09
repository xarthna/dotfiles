" FIXME: yw highlights extra char of next word
function! FlashYankedText()
  if (!exists('g:yankedTextMatches'))
    let g:yankedTextMatches = []
  endif

  let matchId = matchadd('Visual', ".\\%>'\\[\\_.*\\%<']..")
  let windowId = winnr()

  call add(g:yankedTextMatches, [windowId, matchId])
  call timer_start(500, 'DeleteTemporaryMatch')
endfunction

function! DeleteTemporaryMatch(timerId)
  while !empty(g:yankedTextMatches)
    let match = remove(g:yankedTextMatches, 0)
    let windowID = match[0]
    let matchID = match[1]

    try
      call matchdelete(matchID)
    endtry
  endwhile
endfunction

augroup highlightYankedText
  autocmd!
  autocmd TextYankPost * call FlashYankedText()
augroup END

