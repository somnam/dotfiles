" Deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option({
    \ 'num_processes': 2,
    \ 'auto_complete_delay': 10,
    \ 'refresh_always': v:false,
    \ 'ignore_sources': {'_': ['ale']},
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
let s:python_virtualenv_dir = $HOME . '/.config/nvim/python'
if filewritable(s:python_virtualenv_dir)
    let g:ale_virtualenv_dir_names = [s:python_virtualenv_dir]
    let g:ale_linters.python = ['flake8']
    let g:ale_fixers.python = ['autopep8']
endif

" Ale Python LSP
let s:python_lsp_cmd = s:python_virtualenv_dir . "/bin/pyls"
if executable(s:python_lsp_cmd)
    " Use LSP only for ALEGoToDefinition etc.
    let g:ale_linters.python = ['flake8', 'pyls']
    let g:ale_linters_ignore = ['pyls']
    let s:python_extra_paths = [".venv/lib/python3.7/site-packages"]
    let g:ale_python_pyls_config = {'pyls': {'plugins': {
                \'jedi': {'extra_paths': s:python_extra_paths},
                \'jedi_completion': {'include_params': v:false},
                \'jedi_hover': {'enabled': v:false},
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
endif

" Ale Rust LSP
let s:rust_lsp_cmd = $HOME . "/.cargo/bin/rls"
if executable(s:rust_lsp_cmd)
    let g:ale_linters.rust = ['rls']
    let g:ale_fixers.rust = ['rustfmt']
    let g:ale_rust_rls_executable = s:rust_lsp_cmd
    let g:ale_rust_rls_toolchain = 'stable'
endif
