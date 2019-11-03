if ! g:loaded_clever_f
  finish
endif

nmap ; <Plug>(clever-f-repeat-forward)
let g:clever_f_across_no_line=1
let g:clever_f_fix_key_direction = 1
