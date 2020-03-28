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
let g:mucomplete#completion_delay = 125
let g:mucomplete#reopen_immediately = 0
let g:mucomplete#chains = {}
let g:mucomplete#chains.default  = ['c-n', 'omni', 'dict', 'path']
let g:mucomplete#chains.python   = {
            \"pythonString": ['c-n', 'dict', 'path'],
            \"pythonComment": ['c-n', 'dict', 'path'],
            \}
let g:mucomplete#chains.sql      = ['c-n', 'dict', 'path']
let g:mucomplete#chains.vim      = ['cmd', 'c-n', 'path']

" ALE
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_completion_enabled = 0
let g:ale_hover_to_preview = 1
let g:ale_echo_msg_format = '[%severity%] %s'
let g:ale_virtualenv_dir_names = ['.venv/vim', '.env', '.venv', 'env', 'virtualenv', 'venv']
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
" Use a language server (if available) for Python omnifunc completions.
if executable($HOME . "/.venv/vim/bin/pyls")
    autocmd FileType python call s:on_lsp_buffer_enabled()
endif

fun! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=ale#completion#OmniFunc
    nmap <buffer> <A-d> :ALEGoToDefinition<cr>
    nmap <buffer> <A-r> :ALEFindReferences<cr>
    nmap <buffer> <A-R> :ALERename<cr>
    nmap <buffer> <A-]> :ALENext<cr>
    nmap <buffer> <A-[> :ALEPrevious<cr>
    nmap <buffer> <A-k> :ALEHover<cr>
endfun

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
