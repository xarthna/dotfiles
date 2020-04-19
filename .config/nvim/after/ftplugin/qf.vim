nnoremap <silent><buffer> <ESC> :q<CR>
nnoremap <silent><buffer> q :q<CR>
setlocal nowrap

au BufReadPost,WinEnter <buffer> :AnsiEsc

let b:undo_ftplugin = "setlocal wrap<"
