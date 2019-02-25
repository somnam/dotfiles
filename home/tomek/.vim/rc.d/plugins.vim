" Session
command! SS SessionSave
command! SC SessionClose
command! SL SessionList

" Buffer Bye
command! BD Bdelete

" BufferExpolorer
command! LS BufExplorer
command! LH BufExplorerHorizontalSplit
command! LV BufExplorerVerticalSplit

" Airline
let g:airline_theme='sol'
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#whitespace#checks = ['indent']

" CtrlP
" Files limit
let g:ctrlp_max_files = 1000000
" Results window height
let g:ctrlp_max_height = 15
" Ignore vcs folders
let g:ctrlp_custom_ignore = {
\ 'dir':  '\v[\/](\.git|\.vscode|env|__pycache__)$',
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

" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 1
" <CR>: close popup and save indent.
inoremap <expr><CR> pumvisible() ? "\<C-y>" : "\<CR>"

" CSV
let g:csv_highlight_column = 'y'

" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
nmap <Leader>a <Plug>(EasyAlign)

" Gitgutter
let g:gitgutter_realtime = 0
let g:gitgutter_escape_grep = 1
let g:gitgutter_max_signs = 3000
let g:gitgutter_override_sign_column_highlight = 1

" Flake8
let g:flake8_show_in_gutter = 1
