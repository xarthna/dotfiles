augroup fern_settings
  autocmd!
  autocmd FileType fern nmap <silent><buffer> <CR> <Plug>(fern-action-open)<ESC><BAR>:FernDo close<CR>
augroup END

