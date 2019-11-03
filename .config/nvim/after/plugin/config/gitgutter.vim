if ! g:loaded_gitgutter
  finish
endif

let g:gitgutter_map_keys = 0
let g:gitgutter_grep = 'rg'
let g:gitgutter_highlight_linenrs = 1
nmap [c <Plug>(GitGutterPrevHunk)zz
nmap ]c <Plug>(GitGutterNextHunk)zz
nmap <Leader>P <Plug>(GitGutterPreviewHunk)
nmap <Leader>+ <Plug>(GitGutterStageHunk)
nmap <Leader>- <Plug>(GitGutterUndoHunk)
