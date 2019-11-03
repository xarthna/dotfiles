if ! exists(':FloatermToggle')
  finish
endif

let g:floaterm_width = &columns / 2
let g:floaterm_height = float2nr(round(winheight(0)/1.1))
let g:floaterm_winblend = 15
let g:floaterm_position = 'center'

noremap  <silent> <leader>1 :FloatermToggle<CR>
noremap! <silent> <leader>1 <Esc>:FloatermToggle<CR>i
tnoremap <silent> <leader>1 <C-\><C-n>:FloatermToggle<CR>
tnoremap <silent> <leader><leader> <C-\><C-n><CR>

