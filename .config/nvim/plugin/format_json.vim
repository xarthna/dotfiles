function! FormatJson()
  :%!jq --indent 2
endfunction

command! FormatJson call FormatJson()
