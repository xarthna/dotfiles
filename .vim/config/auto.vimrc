au FileType * setlocal formatoptions-=cro
au FilterWritePre * if &diff | setlocal wrap< | endif
au FileType json set conceallevel=1
au FileType tagbar nmap <buffer><C-j> <C-n> | nmap <buffer><C-k> <C-p>
au FileType ruby,javascript nmap <silent><buffer><leader>T :TestFile<CR>
au FileType help map <silent><buffer> q :q<CR>
au FileType undotree nmap <silent><buffer> j J | nmap <silent><buffer> k K
au BufEnter * let b:toggledSignOn=0
au! FileType fzf,qf,GV,undotree,help
au FileType undotree,qf,fzf,GV,help set laststatus=0 norelativenumber nonumber signcolumn=no | au BufLeave <buffer> set laststatus=2
au FileType undotree,fugitive,fugitiveblame,gitmessengerpopup,fzf,help let b:noToggleActive=1
au FileType ruby set foldmethod=expr | set foldexpr=getline(v:lnum)=~'^\\s*#' | exe "normal zM``"

function! ToggleSignColumn()
  if b:toggledSignOn
    set signcolumn=no
    let b:toggledSignOn = 0
  else
    set signcolumn=yes
    let b:toggledSignOn = 1
  endif
endfunction

nmap <silent><leader>sc :call ToggleSignColumn()<CR>

function! ToggleActive(tog)
  if a:tog && !exists('b:noToggleActive')
    set relativenumber
    set cul
    set number
    set laststatus=2
    "set signcolumn=yes
  elseif !a:tog && !exists('b:noToggleActive')
    set norelativenumber
    set nocul
    set nonumber
    set laststatus=0
    "set signcolumn=no
  endif
endfunction

aug ActiveWindow
  au!
  au WinEnter * call ToggleActive(1)
  au WinLeave * call ToggleActive(0)
aug END

aug Test
  au!
  au FileType ruby,javascript
    \ au BufWrite <buffer> if test#exists() |
    \   TestNearest |
    \ endif
aug END

aug FastEscape
  au!
  au InsertEnter * set timeoutlen=0
  au InsertLeave * set timeoutlen=1000
aug END

" Test runners  with ansi color escape happens in quickfix
" FIXME: Reseting style overrides from hi.vim
" au FileType qf :AnsiEsc
