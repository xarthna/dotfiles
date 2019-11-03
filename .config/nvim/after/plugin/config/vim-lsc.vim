let g:lsc_enable_autocomplete  = v:true
let g:lsc_enable_diagnostics   = v:false
let g:lsc_reference_highlights = v:true
let g:lsc_trace_level          = 'off'

let g:lsc_server_commands = {
 \  'ruby': {
 \    'command': 'nc localhost 7658',
 \    'log_level': -1,
 \    'suppress_stderr': v:false,
 \  }
 \}

let g:lsc_auto_map = {
 \  'GoToDefinition': 'gd',
 \  'FindReferences': 'gr',
 \  'Rename': 'gR',
 \  'ShowHover': 'K',
 \  'Completion': 'omnifunc',
 \}
