" Buffer Bye
command! BD Bdelete

" BufferExpolorer
command! LS BufExplorer
command! LH BufExplorerHorizontalSplit
command! LV BufExplorerVerticalSplit

" CtrlP
" Files limit
let g:ctrlp_max_files = 1000000
" Results window height
let g:ctrlp_max_height = 15
" Ignore vcs folders
let g:ctrlp_custom_ignore = {
\ 'dir':  '\v[\/](\.git|\.vscode|pyenv|__pycache__)$',
\ }
" Custom update
let g:ctrlp_lazy_update = 1
" Custom search command
let g:ctrlp_user_command = {
    \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files -cm'],
        \ },
    \ 'fallback': 'find %s -type f'
    \ }

" Use mucomplete
let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#minimum_prefix_length = 3
let g:mucomplete#completion_delay = 100
let g:mucomplete#reopen_immediately = 0
let g:mucomplete#chains = {}
let g:mucomplete#chains.default  = ['path', 'c-n', 'tags', 'omni', 'dict', 'uspl']
let g:mucomplete#chains.sql      = ['path', 'c-n', 'tags', 'dict', 'uspl']
let g:mucomplete#chains.vim      = ['path', 'cmd', 'c-n', 'tags']

" Use a language server for Python omnifunc completions.
" pip install python-language-server
let s:python_lsp_cmd = $HOME . "/.venv/vim/bin/pyls"

" Use vim-lsp
if executable(s:python_lsp_cmd)
    autocmd User lsp_setup call lsp#register_server({
                \ 'name': 'pyls',
                \ 'cmd': {server_info->[s:python_lsp_cmd]},
                \ 'whitelist': ['python'],
                \ 'workspace_config': {'pyls': {'plugins': {
                    \'jedi_completion': {'include_params': v:true},
                    \'jedi_hover': {'enabled': v:true},
                    \'jedi_signature_help': {'enabled': v:true},
                    \'flake8': {'enabled': v:false},
                    \'mccabe': {'enabled': v:false},
                    \'pycodestyle': {
                        \'enabled': v:true,
                        \'maxLineLength': 120,
                        \'ignore': 'W503,W504',
                        \},
                    \'pydocstyle': {'enabled': v:false},
                    \'pyflakes': {'enabled': v:true},
                    \'pylint': {'enabled': v:false},
                    \'yapf': {'enabled': v:false},
                    \'rope_completion': {'enabled': v:false},
                \}}},
                \ })
endif


function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    nmap <buffer> <C-]> <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gR <plug>(lsp-rename)
    nmap <buffer> go <plug>(lsp-document-symbol)
    nmap <buffer> gm <plug>(lsp-signature-help)
    nmap <buffer> K <plug>(lsp-hover)
endfunction

augroup lsp_install
    au!
    " call only for languages that have the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" Closes the preview window on the second call to preview (e.g. (lsp-hover))
let g:lsp_preview_doubletap = [function('lsp#ui#vim#output#closepreview')]
let g:lsp_diagnostics_enabled = 1
let g:lsp_signs_enabled = 0
let g:lsp_highlights_enabled = 0
let g:lsp_highlight_references_enabled = 0
let g:lsp_log_verbose = 0

" CSV
let g:csv_highlight_column = 'y'

" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
nmap <Leader>a <Plug>(EasyAlign)

" Signify
let g:signify_vcs_list = [ 'git' ]

" Python - syntax highlighting
let g:python_highlight_file_headers_as_comments = 0
let g:python_highlight_all = 1
let g:python_slow_sync = 0
