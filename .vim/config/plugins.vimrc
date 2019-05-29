"### NERDTree
let g:NERDTreeDirArrowExpandable = '-'
let g:NERDTreeDirArrowCollapsible = '.'
let NERDTreeMinimalUI = 1
let NERDTreeRespectWildIgnore = 1
let NERDTreeShowHidden = 1
let NERDTreeChDirMode = 2
let NERDTreeQuitOnOpen = 1
let NERDTreeMapOpenVSplit = 'v'
let NERDTreeMapOpenSplit = 's'
nmap <silent><C-n> :NERDTreeToggle<CR>

"### FZF
let g:fzf_action = {
  \ 'ctrl-T': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-space': 'vsplit' }
let g:fzf_layout = { 'down': '~35%' }
let g:fzf_colors =
  \{'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', '4'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', '12'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

nmap <silent><leader>f :Files<CR>
nmap <silent><leader>a :Ag<CR>
nmap <silent><leader>bc :BCommits<cr>
nmap <silent><leader>st :Tags<CR>
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, ' --path-to-ignore ~/.ignore ', {'options': '--delimiter : --nth 4..'}, <bang>0)
command! -bang -nargs=* Rg  call fzf#vim#grep('rg --smart-case --line-number --no-heading --color=always '.shellescape(<q-args>), 0, {'options': '--delimiter : --nth 3 --reverse --prompt "λ "'})

"### Fugitive
nnoremap <silent><leader>gs :Gstatus<cr>
nnoremap <silent><leader>gb :Gblame<cr>
nnoremap <silent><leader>gd :Gdiff<cr>

"### ALE
let g:ale_fix_on_save = 1
let g:ale_linters_explicit = 1
let g:ale_linters = {
\  'ruby': ['rubocop'],
\  'javascript': ['prettier', 'eslint'],
\  'clojure': ['joker'],
\  'crystal': ['crystal'],
\  'elixir': ['credo'],
\  'json': ['prettier', 'jsonlint'],
\  'yaml': ['prettier', 'yamllint'],
\  'java': ['javac']
\}
let g:ale_fixers = {
\  '*': ['remove_trailing_lines', 'trim_whitespace'],
\  'ruby': ['rubocop'],
\  'javascript': ['prettier', 'eslint'],
\  'json': ['prettier', 'fixjson']
\}
nmap <silent> <Plug>MyWrap <Plug>(ale_next_wrap) :call repeat#set("\<Plug>MyWrap", v:count)<cr>
nmap <silent> <Plug>MyPrevWrap <Plug>(ale_previous_wrap) :call repeat#set("\<Plug>MyPrevWrap", v:count)<cr>
nmap <leader>ne <Plug>MyWrap
nmap <leader>pe <Plug>MyPrevWrap

"### Tagbar
let g:tagbar_sort = 0
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
nmap <silent><leader>pt :TagbarTogglePause<CR>
nmap <silent><leader>jt :TagbarOpen j<CR>
nmap <silent><leader>t :TagbarToggle<CR>

"### vim-test
function! ResetTmuxMessageColor(_)
  :call system("tmux set-window-option message-style fg=colour0")
  :call system("tmux set-window-option message-style bg=colour251")
endfunction

function! SendGreen()
  :call system("tmux set-window-option message-style 'bg=#00b300'")
  :call system("tmux display-message ''")
  let timer = timer_start(3000, 'ResetTmuxMessageColor')
endfunction

function! SendRed()
  :call system("tmux set-window-option message-style 'bg=#FF6666'")
  :call system("tmux display-message ''")
  let timer = timer_start(3000, 'ResetTmuxMessageColor')
endfunction

function! InteractiveStrategy(cmd)
  :call system("tmux split-window -v " . a:cmd . " ; tmux resize-pane -y 30")
endfunction

let s:rspec_cmd = 'docker exec -e RAILS_ENV=test -e DOCKER_ENV=true -e RUBYOPT="-W0" virtual_terminal ./bin/rspec --color --fail-fast'
let g:test#custom_strategies = {'interactive': function('InteractiveStrategy')}
let g:test#strategy = "asyncrun"
let g:test#ruby#rspec#executable = s:rspec_cmd
let g:test#javascript#jest#executable = 'docker exec virtual_terminal ./node_modules/.bin/jest'
let g:asyncrun_exit = "if g:asyncrun_status == 'success' | call SendGreen() | else | call SendRed() | endif"

function! ToggleTestStrategy()
  if(g:test#strategy == "asyncrun")
    let g:test#strategy = "interactive"
  else
    let g:test#strategy = "asyncrun"
  endif
endfunction

command! ToggleTestStrategy call ToggleTestStrategy()

"### GitGutter
let g:gitgutter_map_keys = 0

"### json-vim
let g:vim_json_warnings=0

"### Fireplace
nmap ,ro cqp
nmap ,re cpp
nmap <silent>,rr :Require<CR>

"### highlight-yank
let g:highlightedyank_highlight_duration = 500

"### rainbow
let g:rainbow_active = 1
let g:clojure_align_subforms = 1
let g:clojure_align_multiline_strings = 1

"### undotree
let g:undotree_WindowLayout = 4
let g:undotree_ShortIndicators = 0
let g:undotree_SplitWidth = 45
let g:undotree_DiffpanelHeight = 20
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_TreeNodeShape = '•'
let g:undotree_RelativeTimestamp = 0
let g:undotree_HelpLine = 0
let g:clever_f_across_no_line=1
noremap <silent><leader>H :UndotreeToggle<CR>

"### vim-commentary
map <leader>cc gcc

"### clever-f
map ; <Plug>(clever-f-repeat-forward)

"### GV
nmap <silent><leader>gv :GV!<cr>
