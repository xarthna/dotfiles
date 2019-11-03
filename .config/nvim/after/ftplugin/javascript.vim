nnoremap <silent><buffer> <leader>T :TestFile<CR>
nnoremap <silent><buffer> <leader>t :TestNearest<CR>

au! BufWrite <buffer> if test#exists() | TestNearest | endif
au! BufWritePost * call GenerateTags()
