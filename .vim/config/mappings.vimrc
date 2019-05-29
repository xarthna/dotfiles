map Q <nop>
nmap q: <nop>
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>
nmap <C-l> <C-w><C-l>
nmap <C-h> <C-w><C-h>
nmap <C-j> <C-w><C-j>
nmap <C-k> <C-w><C-k>
nmap <space>w <C-w><C-w>
nmap <leader>e :cnext<CR>
nmap <leader>E :cprev<CR>
nmap <leader>u <C-t>
nmap <leader>d <C-]>
nnoremap <leader>bb :b#<CR>
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
inoremap <C-j> <C-n>
inoremap <C-k> <C-p>
cnoremap <C-j> <C-n>
cnoremap <C-k> <C-p>
nnoremap <silent><space> :nohlsearch<Bar>:echo<CR>
nmap <leader>h :h<space>
nmap <tab> %
nmap ' `
nnoremap / /\v
vnoremap / /\v

iabbrev #d '========================================='

function! QuickFixToggle()
  for i in range(1, winnr('$'))
    let bnum = winbufnr(i)
    if getbufvar(bnum, '&buftype') == 'quickfix'
      cclose
      return
    endif
  endfor
  botright copen 25
endfunction

nnoremap <silent><leader><leader> :call QuickFixToggle()<CR>

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special><expr> <Esc>[200~ XTermPasteBegin()
