function! AgQfSearch(term)
  call setqflist([], 'a', { 'lines': systemlist('ag ' . a:term) })
  vertical topleft copen 60
endfunction

command! -nargs=1 AgQfSearch call AgQfSearch(<f-args>)
command! Vimrc :edit $MYVIMRC
command! VimPlugins :edit $HOME/.vim/config/plugins.vimrc
