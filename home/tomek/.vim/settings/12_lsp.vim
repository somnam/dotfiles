" LSP
let g:lsp_preview_float = 0
let g:lsp_completion_documentation_enabled = 0
let g:lsp_diagnostics_enabled = 0
let g:lsp_signs_enabled = 0
let g:lsp_highlights_enabled = 0
let g:lsp_highlight_references_enabled = 0
let g:lsp_signature_help_enabled = 0
let g:lsp_log_verbose = 0

" Set keyboard shortcuts
function! s:on_lsp_buffer_enabled() abort
    nmap <buffer> <Leader>d <plug>(lsp-definition)
    nmap <buffer> <Leader>i <plug>(lsp-implementation)
    nmap <buffer> <Leader>t <plug>(lsp-type-definition)
    nmap <buffer> <Leader>r <plug>(lsp-references)
    nmap <buffer> <Leader>R <plug>(lsp-rename)
    nmap <buffer> <Leader>o <plug>(lsp-document-symbol)
    nmap <buffer> <Leader>m <plug>(lsp-signature-help)
    nmap <buffer> <Leader>k <plug>(lsp-hover)
endfunction

" Load for enabled buffers.
augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" Python LSP
let s:python_lsp_cmd = $HOME . '/.vim/python/bin/pyls'
if executable(s:python_lsp_cmd)
    let s:python_extra_paths = [".venv/lib/python3.7/site-packages"]
    autocmd User lsp_setup call lsp#register_server({
                \'name': 'pyls',
                \'cmd': {server_info->[s:python_lsp_cmd]},
                \'whitelist': ['python'],
                \'workspace_config': {'pyls': {'plugins': {
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
                \}}},
                \ })
    autocmd FileType python setlocal omnifunc=lsp#complete
endif

" Rust LSP
let s:rust_lsp_cmd = $HOME . "/.cargo/bin/rustup"
if executable(s:rust_lsp_cmd)
    autocmd User lsp_setup call lsp#register_server({
                \'name': 'rls',
                \'cmd': {server_info->[s:rust_lsp_cmd, 'run', 'stable', 'rls']},
                \'whitelist': ['rust'],
                \ })
    autocmd FileType rust setlocal omnifunc=lsp#complete
endif
