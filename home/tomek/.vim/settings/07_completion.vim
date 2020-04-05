" Mucomplete
let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#minimum_prefix_length = 2
let g:mucomplete#completion_delay = 50
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
let g:ale_virtualenv_dir_names = ['.venv/vim', '.env', '.venv', 'env', 'virtualenv', 'venv']
let g:ale_linters = {'python': ['flake8']}
let s:python_lsp_cmd = $HOME . "/.venv/vim/bin/pyls"
if executable(s:python_lsp_cmd)
    let g:ale_linters = {'python': ['flake8', 'pyls']}
    let g:ale_linters_ignore = ['pyls']
    let g:ale_python_pyls_config = {'pyls': {'plugins': {
                \'jedi_completion': {'include_params': v:true},
                \'jedi_hover': {'enabled': v:true},
                \'jedi_signature_help': {'enabled': v:false},
                \'pycodestyle': {'enabled': v:false},
                \'pyflakes': {'enabled': v:false},
                \'flake8': {'enabled': v:false},
                \'mccabe': {'enabled': v:false},
                \'pydocstyle': {'enabled': v:false},
                \'pylint': {'enabled': v:false},
                \'yapf': {'enabled': v:false},
                \'rope_completion': {'enabled': v:false},
                \}}}
    autocmd FileType python setlocal omnifunc=ale#completion#OmniFunc
endif
" Set keyboard shortcuts
nmap <buffer> <Leader>n :ALENext<Enter>
nmap <buffer> <Leader>p :ALEPrevious<Enter>
nmap <buffer> <Leader>d :ALEGoToDefinition<cr>
nmap <buffer> <Leader>D :ALEGoToDefinitionInSplit<cr>
nmap <buffer> <Leader>r :ALEFindReferences<cr>
nmap <buffer> <Leader>R :ALERename<cr>
nmap <buffer> <Leader>k :ALEHover<cr>
