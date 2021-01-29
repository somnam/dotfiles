" Set keyboard shortcuts
map <Leader>d :ALEGoToDefinition<Enter>
map <Leader>r :ALEFindReferences<Enter>
map <Leader>R :ALERename<Enter>
map <Leader>k :ALEHover<Enter>

" Ale Python LSP
let s:python_lsp_cmd = $HOME . '/.vim/python/bin/pyls'
if executable(s:python_lsp_cmd)
    " Configure language server
    let g:ale_linters = get(g:, 'ale_linters', {})
    let g:ale_linters.python = ['flake8', 'pyls']
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
    let g:ale_rust_rls_executable = s:rust_lsp_cmd
    let g:ale_rust_rls_toolchain = 'stable'
    autocmd FileType rust setlocal omnifunc=ale#completion#OmniFunc
endif
