" True color support for
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let g:ale_completion_enabled = 0
let g:ale_set_balloons = 0

so $HOME/.vim/config/init.vimrc
so $HOME/.vim/config/general.vimrc
so $HOME/.vim/config/auto.vimrc
so $HOME/.vim/config/plugins.vimrc
so $HOME/.vim/config/mappings.vimrc

" DOC: show current highlight groups applied
" so $VIMRUNTIME/syntax/hitest.vim

set timeoutlen=1000
set ttimeoutlen=0

set re=1
set scrolloff=2

inoremap <C-j> <C-n>
cnoremap <C-j> <C-n>
inoremap <C-k> <C-p>
cnoremap <C-k> <C-p>

" easy help setup
"nnoremap <leader>h :h<space>

" Move by virtual lines and keep line numbers correct
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Emacs style bindings like the shell
:cnoremap <C-a>  <Home>
:cnoremap <C-b>  <Left>
:cnoremap <C-f>  <Right>
:cnoremap <C-d>  <Delete>
:cnoremap <M-b>  <S-Left>
:cnoremap <M-f>  <S-Right>
:cnoremap <M-d>  <S-right><Delete>
:cnoremap <Esc>b <S-Left>
:cnoremap <Esc>f <S-Right>
:cnoremap <Esc>d <S-right><Delete>
:cnoremap <C-g>  <C-c>

" Go back to previous buffer e.g. <c-6>
:nmap <leader>bb :b#<CR>

" Dont need to show insert/visual status because of lightline
set noshowmode

" git gutter
set updatetime=100

hi CursorLineNr guifg=#ff0000

" Automatically toggle paste mode when pasting and reset after done
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

set backupcopy=yes

let g:rainbow_active = 1
let g:clojure_align_subforms = 1
let g:clojure_align_multiline_strings = 1

function! AttachVt()
    :call system("tmux split-window -v docker attach virtual_terminal ; tmux resize-pane -y 20")
endfunction

nmap <Leader>bp obinding.pry<esc>:w<cr>:call AttachVt()<cr>
nmap <leader>Z :call system("tmux resize-pane -Z")<cr>

nmap <leader>d <C-]>
nmap <leader>u <C-t>
nmap <silent><leader>tt :TestFile<CR>
nmap <silent><leader>tn :TestNearest<CR>
nmap <silent><leader>tb :TagbarToggle<CR>
nmap <silent><leader>ts :Tags<CR>

" Give Rg my options
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --smart-case --line-number --no-heading --color=always '.shellescape(<q-args>), 0,
  \    {'options': '--delimiter : --nth 3 --reverse --prompt "λ " --color hl:#929394,hl+:#ff0000'})

"  \    {'options': '--delimiter : --nth 3.. --reverse --prompt "λ " --color hl:#929394,hl+:#ff0000'})

command! Vimrc :edit $MYVIMRC

nmap <leader>e :cn<CR>
nmap <leader>E :cp<CR>

let g:UltiSnipsSnippetsDir="$HOME/.vim/UltiSnips"
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

au BufNewFile,BufRead *_spec.rb set filetype=spec
au BufNewFile,BufRead *_spec.rb set syntax=ruby

set shortmess=a
set shortmess+=WcFstToOI
set linebreak

let g:vimade = {
  \ "normalid": '',
  \ "normalncid": '',
  \ "basefg": '',
  \ "basebg": '',
  \ "fadelevel": 0.4,
  \ "colbufsize": 15,
  \ "rowbufsize": 15,
  \ "checkinterval": 1000,
  \ "usecursorhold": 0,
  \ "detecttermcolors": 1,
  \ "enablesigns": 1,
  \ "signsretentionperiod": 4000
\ }

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
hi Search gui=bold guibg=#504945 guifg=#83a598
" nnoremap <silent> M :call LanguageClient_contextMenu()<CR>
"nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> L :call LanguageClient#textDocument_rename()<CR>
"autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
"autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
"autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
"autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" Put it in clipboard
nnoremap y "+y
vnoremap y "+y
nnoremap d "+d
vnoremap d "+d


set ttymouse=sgr
