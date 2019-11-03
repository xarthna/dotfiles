if ! exists(':NERDTree')
  finish
endif

let g:NERDTreeDirArrowExpandable = '-'
let g:NERDTreeDirArrowCollapsible = '.'
let NERDTreeMinimalUI = 1
let NERDTreeRespectWildIgnore = 1
let NERDTreeShowHidden = 1
let NERDTreeChDirMode = 2
let NERDTreeQuitOnOpen = 1
let NERDTreeMapOpenVSplit = 'v'
let NERDTreeMapOpenSplit = 's'

nnoremap <silent><C-n> :NERDTreeToggle<CR> <C-w>=

function! NERDTreeRefresh()
  if &filetype == "nerdtree"
    silent exe substitute(mapcheck("R"), "<CR>", "", "")
  endif
endfunction

au! BufEnter * call NERDTreeRefresh()
