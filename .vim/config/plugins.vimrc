""""""""""""""""""""""""""""""""""""
"          PLUGINS                 "
""""""""""""""""""""""""""""""""""""
" LightLine
let g:lightline = {
\ 'colorscheme': 'gruvbox',
\ 'active': {
\   'left': [ [ 'mode', 'paste' ],
\             [ 'readonly', 'gitbranch'],
\              ['filename', 'modified' ] ],
\'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
\           [ 'lineinfo' ],
\           [ 'charvaluehex', 'fileformat', 'fileencoding', 'filetype'] ]
\ },
\ 'component': {
\   'charvaluehex': '[%b] 0x%B'
\ },
\ 'component_function': {
\   'gitbranch': 'fugitive#head'
\ }
\ }

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok'
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }

let g:lightline#ale#indicator_checking = " \uf9e5"
let g:lightline#ale#indicator_warnings = "\uf071 "
let g:lightline#ale#indicator_errors = "\uf05e "
let g:lightline#ale#indicator_ok = " \uf00c "


"=========== NERDTree ============="

let g:NERDTreeDirArrowExpandable = '-'
let g:NERDTreeDirArrowCollapsible = '.'
let NERDTreeMinimalUI = 1
let NERDTreeRespectWildIgnore = 1
let NERDTreeShowHidden = 1
let NERDTreeChDirMode = 2
let NERDTreeQuitOnOpen = 1
let NERDTreeMapOpenVSplit = 'v'
let NERDTreeMapOpenSplit = 's'
map <silent><C-n> :NERDTreeToggle<CR>

"============ NERDCommenter ======="
" Dont need everything
let g:NERDCreateDefaultMappings = 0

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left
" instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

nmap <leader>cc <plug>NERDCommenterToggle
vmap <leader>cc <plug>NERDCommenterToggle

"============ FZF ======="
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_layout = { 'down': '~35%' }
nmap <silent><leader>f :Files<CR>
"nmap <leader>b :Buffers<CR>
nmap <silent><leader>a :Ag<CR>
nmap <silent><leader><s-h> :History:<CR>
"nmap <leader>t :Tags<CR>
"imap <c-x><c-k> <plug>(fzf-complete-word)

" Match ag hardcoded highlights from fzf.vim
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

" Fugitive
nnoremap <silent><leader>gs :Gstatus<cr>
nnoremap <silent><leader>gb :Gblame<cr>
nnoremap <silent><leader>gd :Gdiff<cr>

"=============== ALE ==================="
let g:ale_fix_on_save = 1

" Only run linters named in ale_linters settings.
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

" Need to make repeatable
nmap <leader>ne <Plug>(ale_next_wrap)
nmap <leader>pe <Plug>(ale_previous_wrap)
"inoremap <silent> <Plug>(ale_show_completion_menu) <C-x><C-o>

"TagBar
let g:tagbar_sort = 0
"nmap <leader>t :TagbarToggle<CR>

function! ResetTmuxMessageColor(_)
  :call system("tmux set-window-option message-fg colour0")
  :call system("tmux set-window-option message-bg colour251")
endfunction

function! SendGreen()
  :call system("tmux set-window-option message-bg '#00b300'")
  :call system("tmux display-message ''")
  let timer = timer_start(3000, 'ResetTmuxMessageColor')
endfunction

function! SendRed()
  :call system("tmux set-window-option message-bg '#FF6666'")
  :call system("tmux display-message ''")
  let timer = timer_start(3000, 'ResetTmuxMessageColor')
endfunction

nmap <silent><leader>nn :call SendRed()<cr>

let test#strategy = "asyncrun"
let test#ruby#rspec#executable = 'docker exec -e RAILS_ENV=test -e RUBYOPT="-W0" virtual_terminal ./bin/rspec --fail-fast'
let test#crystal#crystalspec#options = '--no-color'
let g:asyncrun_exit = "if g:asyncrun_status == 'success' | call SendGreen() | else | call SendRed() | endif"

"GitGutter

"Provide my own maps
let g:gitgutter_map_keys = 0

" Repeatable next hunk and previous hunk
nnoremap <silent> <plug>NextHunk :GitGutterNextHunk<CR>:GitGutterPreviewHunk<CR> \:call repeat#set("\<plug>NextHunk")<CR>
nmap <leader>nh <plug>NextHunk
nnoremap <silent> <plug>PreviousHunk :GitGutterPrevHunk<CR>:GitGutterPreviewHunk<CR> \:call repeat#set("\<plug>PreviousHunk")<CR>
nmap <leader>ph <plug>NextHunk
nmap <leader>vh <Plug>GitGutterPreviewHunk
nmap <leader>ch :pclose<CR>

"Json-vim Dont show red let ale do that
let g:vim_json_warnings=0

" Fireplace
nmap ,ro cqp
nmap ,re cpp
nmap <silent>,rr :Require<CR>

" Highlight yank
let g:highlightedyank_highlight_duration = 500

let g:vimade = {
  \ "normalid": 0,
  \ "normalncid": 0,
  \ "basefg": '',
  \ "basebg": '',
  \ "fadelevel": 0.7,
  \ "colbufsize": 15,
  \ "rowbufsize": 15,
  \ "checkinterval": 100,
  \ "usecursorhold": 0,
  \ "detecttermcolors": 1,
  \ "enablesigns": 1,
  \ "signsretentionperiod": 4000
\ }

let g:rainbow_active = 1
let g:clojure_align_subforms = 1
let g:clojure_align_multiline_strings = 1

let g:UltiSnipsSnippetsDir="$HOME/.vim/UltiSnips"
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'


" Give Rg my options
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --smart-case --line-number --no-heading --color=always '.shellescape(<q-args>), 0,
  \    {'options': '--delimiter : --nth 3 --reverse --prompt "λ " --color hl:#929394,hl+:#ff0000'})


"let g:vim_search_pulse_duration = 200
let g:vim_search_pulse_color_list = ['#3a3a3a', '#444444', '#4e4e4e', '#585858', '#606060']
