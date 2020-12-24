function! GenerateTags()
  call jobstart('ctags --options=$HOME/.ctags -o .tags -R .')
endfunction

function! GenerateDependencyTags()
  call jobstart('ctags --options=$HOME/.ctags -o .tags -R `bundle show --paths`')
endfunction
