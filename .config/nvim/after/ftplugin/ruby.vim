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

let b:undo_ftplugin = "setlocal foldmethod< foldexpr< iskeyword< keywordprg<"
