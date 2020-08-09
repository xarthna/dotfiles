let g:wiki_root = '~/Documents/wiki'

function! JumpToWikiRoot()
  exe 'edit ' . g:wiki_root . '/index.md'
  :cd %:p:h
endfunction

nnoremap <leader>w :call JumpToWikiRoot()<cr>
