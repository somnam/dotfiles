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
let s:omni_rust = { t -> t =~# '\m\%(\k::\|\.\)$' }
let g:mucomplete#can_complete = {}
let g:mucomplete#can_complete.python = { 'omni': s:omni_py }
let g:mucomplete#can_complete.rust = { 'omni': s:omni_rust }

" Ale
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_completion_enabled = 0
let g:ale_set_balloons = 0
let g:ale_hover_to_preview = 0
let g:ale_echo_msg_format = '[%severity%] %s'

let g:ale_linters = {}
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace']}

" Set keyboard shortcuts
map <Leader>] :ALENext<Enter>
map <Leader>[ :ALEPrevious<Enter>
map <Leader>f :ALEFix<Enter>
map <Leader>d :ALEGoToDefinition<Enter>
map <Leader>D :ALEGoToDefinitionInSplit<Enter>
map <Leader>r :ALEFindReferences<Enter>
map <Leader>R :ALERename<Enter>
map <Leader>k :ALEHover<Enter>

" Ale Python
let s:python_virtualenv_dir = $HOME . '/.vim/python'
if filewritable(s:python_virtualenv_dir)
    let g:ale_virtualenv_dir_names = [s:python_virtualenv_dir]
    let g:ale_linters.python = ['flake8']
    let g:ale_fixers.python = ['autopep8']
endif

" Ale Python LSP
let s:python_lsp_cmd = s:python_virtualenv_dir . "/bin/pyls"
if executable(s:python_lsp_cmd)
    " Configure language server
    let g:ale_linters.python = ['flake8', 'pyls']
    let g:ale_fixers.python = ['autopep8']
    let g:ale_linters_ignore = ['pyls']
    let s:python_extra_paths = [".venv/lib/python3.7/site-packages"]
    let g:ale_python_pyls_config = {'pyls': {'plugins': {
                \'jedi': {'extra_paths': s:python_extra_paths},
                \'jedi_completion': {'include_params': v:true},
                \'jedi_hover': {'enabled': v:true},
                \'jedi_signature_help': {'enabled': v:false},
                \'pydocstyle': {'enabled': v:false},
                \'pycodestyle': {'enabled': v:false},
                \'pyflakes': {'enabled': v:false},
                \'flake8': {'enabled': v:false},
                \'mccabe': {'enabled': v:false},
                \'pylint': {'enabled': v:false},
                \'yapf': {'enabled': v:false},
                \'rope_completion': {'enabled': v:false},
                \}}}
    autocmd FileType python setlocal omnifunc=ale#completion#OmniFunc
endif


" Ale Rust LSP
let s:rust_lsp_cmd = $HOME . "/.cargo/bin/rls"
if executable(s:rust_lsp_cmd)
    let g:ale_linters.rust = ['rls']
    let g:ale_fixers.rust = ['rustfmt']
    let g:ale_rust_rls_executable = s:rust_lsp_cmd
    let g:ale_rust_rls_toolchain = 'stable'

    autocmd FileType rust setlocal omnifunc=ale#completion#OmniFunc
endif
