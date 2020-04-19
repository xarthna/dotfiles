if !exists(':FZF')
  finish
endif

let g:fzf_action = {
  \ 'ctrl-T': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-i': 'vsplit' }

let g:fzf_layout = { 'down': '~35%' }

autocmd! FileType fzf
autocmd  FileType fzf setlocal nonumber norelativenumber

nnoremap <silent><LocalLeader>f :Files<CR>
nnoremap <silent><localleader>a :Rg<CR>
nnoremap <silent><localleader>c :BCommits<cr>
nnoremap <silent><localleader>b :BTags<CR>
nnoremap <silent><localleader>t :Tags<CR>
nnoremap <silent><localleader>/ :Lines<CR>
"nnoremap <leader>d :call fzf#vim#tags(expand('<cword>'), {'options': '--exact --select-1 --exit-0'})<CR>

command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, ' --path-to-ignore ~/.ignore ', {'options': '--delimiter : --nth 4..'}, <bang>0)

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, {'options': '--bind "ctrl-l:preview-down,ctrl-h:preview-up" --preview-window="right:55%" --preview "bat --style=numbers,changes --color always {}"'}, <bang>0)

 command! -bang -nargs=* Rg  
  \ call fzf#vim#grep('rg --smart-case --line-number --no-heading --color=always --no-hidden --ignore '.shellescape(<q-args>), 
  \ 0,
  \ fzf#vim#with_preview({'options': '-e --delimiter : --nth 3..'}),
  \ <bang>0)

command! -bang BCommits
  \ call fzf#vim#buffer_commits({
  \     'options': '--reverse 
  \                 --bind "ctrl-l:preview-down,ctrl-h:preview-up" 
  \                 --preview-window="50%"
  \                 --preview "git show --format=format: --color=always {1} ' . expand('%:p') . '"'
  \ })

command! -bang BTags
  \ call fzf#vim#buffer_tags('', {
  \     'options': '--reverse 
  \                 --no-sort
  \                 --bind "ctrl-l:preview-down,ctrl-h:preview-up" 
  \                 --preview-window="80%" 
  \                 --preview "
  \                     tail -n +\$(echo {3} | tr -d \";\\\"\") {2} | head -n 24 |
  \                     bat --style=numbers,changes --color=always -l '.&ft.'"'
  \ })

