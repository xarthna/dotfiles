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

" Add html for tpl files
"""au BufNewFile,BufRead *.tpl set filetype=html
