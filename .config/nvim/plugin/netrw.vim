let g:netrw_banner = 0
let g:netrw_list_hide= '\(^\|\s\s\)\zs\.\S\+'

augroup netrw_settings
  autocmd!
  autocmd FileType netrw nnoremap <buffer> q :q<CR>
  autocmd FileType netrw nnoremap <buffer> <leader>b :Rex<CR>
  autocmd FileType netrw nnoremap <buffer> <C-^> :Rex<CR>
  autocmd FileType netrw set timeoutlen=200
  autocmd FileType netrw autocmd BufLeave * set timeoutlen=1000
augroup END
