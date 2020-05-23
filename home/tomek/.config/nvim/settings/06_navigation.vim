" Files limit
let g:ctrlp_max_files = 1000000
" Results window height
let g:ctrlp_max_height = 15
" Ignore vcs folders
let g:ctrlp_custom_ignore = {'dir': '\v[\/](\.git|__pycache__)$'}
" Custom update
let g:ctrlp_lazy_update = 1
" Custom search command
let g:ctrlp_user_command = {
    \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files -co --exclude-standard'],
        \ },
    \ 'fallback': 'find %s -type f'
    \ }
