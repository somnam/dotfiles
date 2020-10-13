" Deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option({
    \ 'num_processes': 2,
    \ 'auto_complete_delay': 10,
    \ 'refresh_always': v:false,
    \ 'ignore_sources': {'_': ['ale'], 'python': ['omni']},
    \ })
call deoplete#custom#var('omni', 'input_patterns', {
    \ 'python': '[^. \t0-9]\.\w*$' . '|^\s*@\w*$' . '|^\s*from\s.+import \w*' . '|^\s*from \w*' . '|^\s*import \w*',
    \})

" Deoplete python integration
let g:deoplete#sources#jedi#ignore_errors = 1
