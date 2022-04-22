" LSP

" Disable diagnostics support
let g:lsp_diagnostics_enabled = 0
let g:lsp_document_code_action_signs_enabled = 0
let g:lsp_completion_documentation_enabled = 0

" Disable logging.
let g:lsp_log_verbose = 0

" Timeout for sync format cancel.
let g:lsp_format_sync_timeout = 1000

" Set keyboard shortcuts
fun! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete

    if exists('+tagfunc')
        setlocal tagfunc=lsp#tagfunc
    endif

    nmap <buffer> <Leader>d <plug>(lsp-definition)
    nmap <buffer> <Leader>r <plug>(lsp-references)
    nmap <buffer> <Leader>R <plug>(lsp-rename)
    nmap <buffer> <Leader>o <plug>(lsp-document-symbol)
    nmap <buffer> <Leader>m <plug>(lsp-signature-help)
    nmap <buffer> <Leader>k <plug>(lsp-hover)
endfun

" Load for enabled buffers.
augroup lsp_install
    au!
    au User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" Python LSP
let s:python_virtualenv_dir = $HOME . '/.local/share/nvim/python'
let s:python_lsp_cmd = s:python_virtualenv_dir . '/bin/jedi-language-server'
if executable(s:python_lsp_cmd)
    autocmd User lsp_setup call lsp#register_server({
                \'name': 'jedi-language-server',
                \'cmd': {server_info->[s:python_lsp_cmd]},
                \'whitelist': ['python'],
                \})
endif

" Rust LSP
let s:rust_lsp_cmd = $HOME . "/.cargo/bin/rustup"
if executable(s:rust_lsp_cmd)
    autocmd User lsp_setup call lsp#register_server({
                \'name': 'rls',
                \'cmd': {server_info->[s:rust_lsp_cmd, 'run', 'stable', 'rls']},
                \'whitelist': ['rust'],
                \ })
endif
