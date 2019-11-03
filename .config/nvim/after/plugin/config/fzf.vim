if !exists(':FZF')
  finish
endif

let g:fzf_action = {
  \ 'ctrl-T': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-i': 'vsplit' }
"let g:fzf_layout = { 'down': '~35%' }
let g:fzf_colors =
  \{'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'FloatTermNormal'],
  \ 'hl':      ['fg', '4'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', '12'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:fzf_layout = { 'window': 'call FloatingFZF()' }

function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let height = float2nr(round(winheight(0)/2))
  let width = float2nr(&columns / 1.3)
  let col = float2nr((&columns - width) / 2)
  let row = float2nr((&lines - height) / 2)

  let opts = {
        \ 'relative': 'editor',
        \ 'row': row,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction

autocmd! FileType fzf
autocmd  FileType fzf setlocal nonumber norelativenumber

noremap <silent><leader>f :Files<CR>
noremap <silent><leader>a :Ag<CR>

noremap <silent><space>cc :BCommits<cr>
noremap <silent><space>b :Buffers<CR>
nmap <silent><space>s :Tags<CR>

command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, ' --path-to-ignore ~/.ignore ', {'options': '--delimiter : --nth 4..'}, <bang>0)
command! -bang -nargs=* Rg  call fzf#vim#grep('rg --smart-case --line-number --no-heading --color=always '.shellescape(<q-args>), 0, {'options': '--delimiter : --nth 3 --reverse --prompt "λ "'})
