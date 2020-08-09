setlocal conceallevel=2

if exists('g:loaded_ft_markdown')
  finish
endif

let g:vim_markdown_follow_anchor = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_strikethrough = 1
let g:loaded_ft_markdown = 1

function CreateFootnote(n)
  call feedkeys("i[\<C-k>" . a:n . "S](#" . a:n .")\<ESC>Go" . a:n . ". ")
endfunction

function JumpLink()
  " Possibly jump from footnote to text
  exe "normal /\\v\[.*\]\(.*\)/e\<CR>ge"
endfunction

nnoremap <silent> <CR> :call JumpLink()<CR>
nnoremap <silent> <leader>fc :call CreateFootnote(input('FootNote: '))<CR>

function! ReloadPdf()
  let l:current_file = expand('%:p') 
  let l:output_file = expand('%:r') . '.pdf '
  call system("/usr/bin/pandoc -f markdown -s --template=/usr/share/pandoc/data/templates/default.latex -o " . l:output_file . l:current_file)
endfunction

let b:undo_ftplugin = "setlocal conceallevel<"
