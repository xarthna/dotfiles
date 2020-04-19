if ! g:loaded_fugitive
  finish
endif

nnoremap <silent>gs :vertical Gstatus<cr>
nnoremap <silent>gb :GitMessenger<cr>
nnoremap <silent>gB :Gblame<cr>
nnoremap <silent>gd :Gdiff<cr>

augroup vimrc
  autocmd!
  autocmd BufWritePre /tmp/* setlocal noundofile
augroup END

autocmd BufReadPost fugitive://* set bufhidden=delete

" autocmd User fugitive
"   \ if b:fugitive_type =~# '^\%(tree\|blob\)$' |
"   \   nnoremap <buffer> <leader>ba :edit %:h<CR> |
"   \ endif

