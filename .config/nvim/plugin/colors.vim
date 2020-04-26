" hi ActiveTerminal guibg=#151515
" hi! link TermCursorNC Cursor

function! MyOverrides() abort
  " Show git merge error markers
  match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$' 
  hi link Pmenu CursorLine
  hi link TermCursor Cursor
  hi link StatusBg CursorLine
  hi link MaterialThemeParens Visual
  hi PmenuSbar guibg=#1b2327 guifg=#1b2327
  hi PmenuSel guifg=#eeffff guibg=#667278 gui=italic
  hi HighlightedyankRegion guifg=#eeffff guibg=#667278 gui=bold
  hi LinterOk guifg=#00FF00 guibg=#1b2327
  hi LinterWarn guifg=#EAF940 guibg=#1b2327
  hi LinterError guifg=#FF0000 guibg=#1b2327
  hi Path guifg=#8be9fd guibg=#1b2327 gui=italic
  hi ModeOrange guibg=#FE8019 guifg=#262626
  hi ModeGreen guibg=#B8BB26 guifg=#262626
  hi ModeAqua guibg=#8EC07C guifg=#262626
  hi ModeNormal guibg=#EBDBB2 guifg=#262626
  hi! MatchParen guibg=#c3e88d
endfunction

augroup ColorOverrides
    autocmd!
    autocmd ColorScheme * call MyOverrides()
augroup END
