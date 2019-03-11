"nnoremap <leader>e :edit $MYVIMRC<CR>
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>

noremap <leader>p "+p
noremap <leader>P "+P
vnoremap <leader>y "+y
vnoremap <leader>d "+d
noremap <leader><leader> V

" Sudo make me a sandwich
cmap w!! w !sudo tee % >/dev/null


" Disable help key
"inoremap <F1> <nop>
"nnoremap <F1> <nop>
"vnoremap <F1> <nop>

" Create splits and jump
nnoremap <leader>\| :vnew<CR><C-w>h
nnoremap <leader>- :new<CR><C-w>k

" Resize splits
nnoremap <silent> <Plug>ResizeWindowUp :resize -15<CR> \:call repeat#set("\<Plug>ResizeWindowUp")<CR>
nmap <leader>K <Plug>ResizeWindowUp

"nmap <silent> <leader>K :resize -15<CR>

nmap <silent> <leader>J :resize +15<CR>
nmap <silent> <leader>L :vertical resize +15<CR>

nnoremap <silent> <Plug>ResizeWindowLeft :vertical resize -15<CR> \:call repeat#set("\<Plug>ResizeWindowLeft")<CR>
nmap <leader>H <Plug>ResizeWindowLeft
"nmap <silent> <leader>H :vertical resize -15<CR>

" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <space> :nohlsearch<Bar>:echo<CR>

" Map tab to jump between pairs
noremap <tab> %

" This maps over jumping to top and bottom of screen
" Only use relative jumps if need that behavior
" End of line and beginning of line
nnoremap <S-l> $
nnoremap <S-h> ^

" Perl like regex
"nnoremap / /\v
"vnoremap / /\v

function! QuickFixToggle()
    for i in range(1, winnr('$'))
        let bnum = winbufnr(i)
        if getbufvar(bnum, '&buftype') == 'quickfix'
            cclose
            return
        endif
    endfor

    vertical topleft copen 60
endfunction

"nnoremap <silent> z :call QuickFixToggle()<cr>
nnoremap <silent><leader><leader> :call QuickFixToggle()<cr>

function! LocationListToggle()
    for i in range(1, winnr('$'))
        let bnum = winbufnr(i)
        if getbufvar(bnum, '&buftype') == 'location'
            lclose
            return
        endif
    endfor

    vertical topleft lopen 60
endfunction

"nnoremap <silent> <leader><leader>l :call LocationListToggle()<cr>

"Window navigation
nmap <leader>h <C-w>h
nmap <leader>j <C-w>j
nmap <leader>k <C-w>k
nmap <leader>l <C-w>l
