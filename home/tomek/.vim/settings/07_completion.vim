" Mucomplete
let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#completion_delay = 50
let g:mucomplete#reopen_immediately = 0
let g:mucomplete#chains = {}
let g:mucomplete#chains.default  = ['keyn', 'c-n', 'omni', 'dict', 'path']
let g:mucomplete#chains.python   = {
            \"pythonString": ['keyn', 'c-n', 'dict', 'path'],
            \"pythonComment": ['keyn', 'c-n', 'dict', 'path'],
            \}
let g:mucomplete#chains.sql      = ['keyn', 'c-n', 'dict', 'path']
let g:mucomplete#chains.vim      = ['cmd', 'keyn', 'c-n', 'path']

" Python omni completion regex.
let s:omni_py = { t -> t =~# '\m\%(\k\.\|^\s*from\s.\+import\s\k\)$' }
let g:mucomplete#can_complete = {}
let g:mucomplete#can_complete.python = { 'omni': s:omni_py }

" Ale
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_completion_enabled = 0
let g:ale_hover_to_preview = 0
let g:ale_echo_msg_format = '[%severity%] %s'
let g:ale_virtualenv_dir_names = ['.vim/python', '.env', '.venv', 'env', 'virtualenv', 'venv']
let g:ale_linters = {'python': ['flake8']}

" Set keyboard shortcuts
map <Leader>] :ALENext<Enter>
map <Leader>[ :ALEPrevious<Enter>

let s:python_lsp_cmd = $HOME . "/.vim/python/bin/pyls"
if executable(s:python_lsp_cmd)
    " Configure language server
    let g:ale_linters = {'python': ['flake8', 'pyls']}
    let g:ale_linters_ignore = ['pyls']
    let g:ale_python_pyls_config = {'pyls': {'plugins': {
                \'jedi_completion': {'include_params': v:true},
                \'jedi_hover': {'enabled': v:false},
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

    " Set keyboard shortcuts
    map <Leader>d :ALEGoToDefinition<Enter>
    map <Leader>D :ALEGoToDefinitionInSplit<Enter>
    map <Leader>r :ALEFindReferences<Enter>
    map <Leader>R :ALERename<Enter>
    map <Leader>k :ALEHover<Enter>
endif
