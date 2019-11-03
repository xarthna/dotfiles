if ! g:loaded_fugitive
  finish
endif

nnoremap <silent>gs :vertical Gstatus<cr>
nnoremap <silent>gb :GitMessenger<cr>
nnoremap <silent>gB :Gblame<cr>
nnoremap <silent>gd :Gdiff<cr>
