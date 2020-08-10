function! CheckIfRailsProject()
  if filereadable("Gemfile")
    let s:count = system("grep -c \"gem 'rails'\" Gemfile")
    if s:count > 0
      let s:paths = add(map(filter(systemlist('ls app'), '(v:val != "assets" && v:val != "views")'), '"app/" . v:val . "/**/"'), 'lib/**/')
      let &path = join(s:paths, ',')
    endif
  endif
endfunction

au! DirChanged * call CheckIfRailsProject()
