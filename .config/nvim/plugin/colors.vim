" hi ActiveTerminal guibg=#151515
" hi! link TermCursorNC Cursor

function! MyOverrides() abort
  " Show git merge error markers
  match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$' 
  hi PmenuSel gui=italic
  hi LinterOk guifg=#00FF00 guibg=#262626
  hi LinterWarn guifg=#EAF940 guibg=#262626
  hi LinterError guifg=#FF0000 guibg=#262626
  hi Path guifg=#79b8ff guibg=#262626 gui=italic
  hi ModeOrange guibg=#FE8019 guifg=#262626
  hi ModeGreen guibg=#B8BB26 guifg=#262626
  hi ModeAqua guibg=#8EC07C guifg=#262626
  hi ModeNormal guibg=#EBDBB2 guifg=#262626
endfunction

augroup ColorOverrides
    autocmd!
    autocmd ColorScheme * call MyOverrides()
augroup END
