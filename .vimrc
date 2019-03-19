" True color support
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set guicursor=n-v-c-i:block,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait10-blinkoff150-blinkon175

so $HOME/.vim/config/init.vimrc
so $HOME/.vim/config/general.vimrc
so $HOME/.vim/config/auto.vimrc
so $HOME/.vim/config/plugins.vimrc
so $HOME/.vim/config/mappings.vimrc
so $HOME/.vim/config/commands.vimrc
so $HOME/.vim/config/hi.vimrc

" Just paste stuff without thinking
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction
