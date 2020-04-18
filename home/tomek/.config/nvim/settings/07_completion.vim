" Deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option({
\ 'num_processes': 2,
\ 'auto_complete_delay': 10,
\ 'refresh_always': v:false,
\ })
call deoplete#custom#var('omni', 'input_patterns', {
\ 'python': '[^. \t0-9]\.\w*$' . '|^\s*@\w*$' . '|^\s*from\s.+import \w*' . '|^\s*from \w*' . '|^\s*import \w*',
\})
" Deoplete python integration
let g:deoplete#sources#jedi#ignore_errors = 1


" Ale
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_completion_enabled = 0
let g:ale_hover_to_preview = 1
let g:ale_echo_msg_format = '[%severity%] %s'
let g:ale_virtualenv_dir_names = ['.venv/nvim', '.env', '.venv', 'env', 'virtualenv', 'venv']
let g:ale_linters = {'python': ['flake8']}

" Set keyboard shortcuts
map <Leader>] :ALENext<Enter>
map <Leader>[ :ALEPrevious<Enter>
