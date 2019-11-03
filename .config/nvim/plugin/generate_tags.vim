function! GenerateTags()
  call jobstart('ctags --options=$HOME/.ctags -o .tags -R -a .')
endfunction

function! GenerateDependencyTags()
  call jobstart('ctags --options=$HOME/.ctags -o .tags -R -a  `bundle show --paths`')
endfunction
