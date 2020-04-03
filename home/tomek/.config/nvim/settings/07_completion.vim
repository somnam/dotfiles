" Deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('num_processes', 2)
call deoplete#custom#option('auto_complete_delay', 10)
call deoplete#custom#option('refresh_always', v:false)

" Ale
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_completion_enabled = 0
let g:ale_hover_to_preview = 1
let g:ale_echo_msg_format = '[%severity%] %s'
let g:ale_virtualenv_dir_names = ['.venv/nvim', '.env', '.venv', 'env', 'virtualenv', 'venv']
let g:ale_linters = {'python': ['flake8', 'pyls']}
let g:ale_linters_ignore = ['pyls']
let g:ale_python_pyls_config = {'pyls': {'plugins': {
            \'jedi_completion': {'include_params': v:true},
            \'jedi_hover': {'enabled': v:true},
            \'jedi_signature_help': {'enabled': v:false},
            \'pycodestyle': {
                \'enabled': v:false,
                \'maxLineLength': 120,
                \'ignore': 'W503,W504',
                \},
            \'pyflakes': {'enabled': v:false},
            \'flake8': {'enabled': v:false},
            \'mccabe': {'enabled': v:false},
            \'pydocstyle': {'enabled': v:false},
            \'pylint': {'enabled': v:false},
            \'yapf': {'enabled': v:false},
            \'rope_completion': {'enabled': v:false},
            \}}}

" Set keyboard shortcuts
autocmd FileType python call s:on_lsp_buffer_enabled()

fun! s:on_lsp_buffer_enabled() abort
    nmap <buffer> cd :ALEGoToDefinition<cr>
    nmap <buffer> cD :ALEGoToDefinitionInSplit<cr>
    nmap <buffer> cr :ALEFindReferences<cr>
    nmap <buffer> cR :ALERename<cr>
    nmap <buffer> c] :ALENext<cr>
    nmap <buffer> c[ :ALEPrevious<cr>
    nmap <buffer> ck :ALEHover<cr>
endfun
