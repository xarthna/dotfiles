if ! g:loaded_ale
  finish
endif

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
