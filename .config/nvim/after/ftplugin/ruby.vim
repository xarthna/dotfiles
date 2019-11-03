setlocal foldmethod=expr
setlocal foldexpr=getline(v:lnum)=~'^\\s*#'
setlocal iskeyword+=!,?

nnoremap <silent><buffer> <leader>T :TestFile<CR>
nnoremap <silent><buffer> <leader>t :TestNearest<CR>

au! BufWrite <buffer> if test#exists() | TestNearest | endif
au! BufWritePost * call GenerateTags()

"if exists(b:vcm_tab_complete)
"  let b:vcm_tab_complete = "omni"
"endif

execute "normal zM``"

let b:undo_ftplugin = "setlocal foldmethod< foldexp< iskeyword<"
