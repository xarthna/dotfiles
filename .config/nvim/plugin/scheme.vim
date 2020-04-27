let g:scheme_executable = "$HOME/bin/scheme.sh"

function! SchemeConnectWrapper()
  :SchemeConnect
  exe "normal \<C-w>L"
  vert resize -50
  exe "normal \<C-w>h"
endfunction

command! SConnect call SchemeConnectWrapper()
