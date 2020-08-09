function! OpenMarkdownPreview() abort
  if exists('s:markdown_job_id') && s:markdown_job_id > 0
    call jobstop(s:markdown_job_id)
    unlet s:markdown_job_id
  endif
  let s:markdown_job_id = jobstart('grip ' . shellescape(expand('%:p')))
  if s:markdown_job_id <= 0 | return | endif
  call system('open http://localhost:6419')
endfunction

nnoremap <Plug>OpenMarkdownPreview
      \ :<C-U>call <SID>OpenMarkdownPreview()<CR>

function! s:OnEvent(job_id, data, event) dict
  unlet s:pandoc_job_id
endfunction

let s:callbacks = {
  \ 'on_exit': function('s:OnEvent')
  \ }

function! OpenPandocPreview() abort
  let s:pandoc_job_id = jobstart('pandoc -f markdown -s --template=/usr/share/pandoc/data/templates/default.latex -o ' . expand('%:r') . '.pdf ' . expand('%:p'), s:callbacks)
  if s:pandoc_job_id <= 0 | return | endif
  if g:isMac
    call system('open -a skim -g ' . expand('%:r') . '.pdf')
  else
    call system('zathura --fork ' . expand('%:r') . '.pdf')
  endif
endfunction

nnoremap <Plug>OpenPandocPreview
      \ :<C-U>call <SID>OpenPandocPreview()<CR>
