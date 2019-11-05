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
        \ 1: ['.git', 'cd %s && git ls-files'],
        \ },
    \ 'fallback': 'find %s -type f'
    \ }

" Use mucomplete
let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#minimum_prefix_length = 3
let g:mucomplete#chains = {}
let g:mucomplete#chains.default  = ['c-n', 'path', 'omni', 'keyn', 'dict', 'uspl']
let g:mucomplete#chains.vim      = ['c-n', 'path', 'cmd', 'keyn']

" Use a language server for Python omnifunc completions.
let s:python_lsp_cmd = $HOME . "/.venv/vim/bin/pyls"
if executable(s:python_lsp_cmd)
    " pip install python-language-server
    autocmd User lsp_setup call lsp#register_server({
                \ 'name': 'pyls',
                \ 'cmd': {server_info->[s:python_lsp_cmd]},
                \ 'whitelist': ['python'],
                \ 'workspace_config': {'pyls': {'plugins': {
                    \'jedi_completion': {'include_params': v:false},
                    \'jedi_signature_help': {'enabled': v:false},
                    \'jedi_hover': {'enabled': v:false},
                    \'flake8': {'enabled': v:false},
                    \'pycodestyle': {'enabled': v:false},
                    \'pydocstyle': {'enabled': v:false},
                    \'pyflakes': {'enabled': v:false},
                    \'yapf': {'enabled': v:false},
                \}}},
                \ })
endif

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

" Flake8
let s:flake8_cmd = $HOME . "/.venv/vim/bin/flake8"
if filereadable(s:flake8_cmd)
    let g:flake8_show_in_gutter = 1
    let g:flake8_cmd = s:flake8_cmd
    " Validate file using flake8 after each save.
    autocmd FileType python autocmd! BufWritePost <buffer> call Flake8()
endif
