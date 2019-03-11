" Disable autocomment lines for every file
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" function! <SID>StripTrailingWhitespaces()
"     " Preparation: save last search, and cursor position.
"     let _s=@/
"     let l = line(".")
"     let c = col(".")
"     %s/\s\+$//e " Replace whitespace
"     let @/=_s " Restore previous search history, and cursor position
"     call cursor(l, c)
" endfunction

" Stripe trailing whitespace on save. Need to whitelist filetypes as needed
" e.g. Markdown
"autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Vimdiff set wrap same as global option
autocmd FilterWritePre * if &diff | setlocal wrap< | endif

function! SetColorColumn(_)
   let c = 1
   let total = []
   while c <= 256
     call add(total, c)
     let c += 1
   endwhile
   :let &colorcolumn=join(total, ",")
   "hi LineNr guibg=#3c3836
endfunction

function! RemoveColorColumn()
  :set colorcolumn=0
endfunction

nmap <leader>nn :call SetColorColumn()<cr>

function! HideSchema()
  normal vapzf
endfunction

augroup hideschema
  autocmd!
  autocmd FileType ruby if getline('.') =~ "Schema Information" |
    \  :call HideSchema() |
    \ endif
augroup END

augroup DimInactiveHighlight
  autocmd!
  autocmd WinEnter * set relativenumber
  autocmd WinLeave * set norelativenumber
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
  " autocmd WinLeave * call SetColorColumn()
  " autocmd WinEnter * call RemoveColorColumn()
augroup END

" Ag from fzf.vim to not match on filenames
"command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

augroup test
  autocmd!
  autocmd BufWrite * if test#exists() |
    \   TestNearest |
    \ endif
augroup END

au FileType json set conceallevel=1

function! s:goyo_enter()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
  set nornu
  set nonu
  Limelight
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showcmd
  set scrolloff=2
  set nu
  set rnu
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

au BufNewFile,BufRead *_spec.rb set filetype=spec
au BufNewFile,BufRead *_spec.rb set syntax=ruby

au FileType ruby nmap <silent><buffer><leader>tt :TestFile<CR>
au FileType ruby nmap <silent><buffer><leader>tn :TestNearest<CR>


function! AttachVt()
    :call system("tmux split-window -v docker attach virtual_terminal ; tmux resize-pane -y 20")
endfunction

au FileType ruby nmap <silent><buffer><leader>bp obinding.pry<esc>:w<cr>:call AttachVt()<cr>
au FileType ruby nmap <silent><buffer><leader>Z :call system("tmux resize-pane -Z")<cr>
