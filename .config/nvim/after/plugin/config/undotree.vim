if ! g:loaded_undotree
  finish
endif

let g:undotree_WindowLayout = 4
let g:undotree_ShortIndicators = 0
let g:undotree_SplitWidth = 45
let g:undotree_DiffpanelHeight = 20
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_TreeNodeShape = '•'
let g:undotree_RelativeTimestamp = 0
let g:undotree_HelpLine = 0
noremap <silent><leader>H :UndotreeToggle<CR>
