" Mucomplete
let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#completion_delay = 10
let g:mucomplete#reopen_immediately = 0
let g:mucomplete#chains = {}
let g:mucomplete#chains.default  = ['c-n', 'omni', 'dict', 'path']
let g:mucomplete#chains.python   = {
            \"pythonString": ['c-n', 'dict', 'path'],
            \"pythonComment": ['c-n', 'dict', 'path'],
            \}
let g:mucomplete#chains.sql      = ['c-n', 'dict', 'path']
let g:mucomplete#chains.vim      = ['cmd', 'c-n', 'path']

" Ale
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_completion_enabled = 0
let g:ale_hover_to_preview = 1
let g:ale_echo_msg_format = '[%severity%] %s'
let g:ale_virtualenv_dir_names = ['.vim/python', '.env', '.venv', 'env', 'virtualenv', 'venv']
let g:ale_linters = {'python': ['flake8']}

" Set keyboard shortcuts
map <Leader>] :ALENext<Enter>
map <Leader>[ :ALEPrevious<Enter>
