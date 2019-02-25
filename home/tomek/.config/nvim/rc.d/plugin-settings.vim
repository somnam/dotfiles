" NCM2 settings
" Enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
" Suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c
" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>" : "\<CR>")

" Buffer Bye
command! BD Bdelete

" BufferExpolorer
command! LS BufExplorer
command! LH BufExplorerHorizontalSplit
command! LV BufExplorerVerticalSplit

" Airline
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
" Validate file using flake8 after each save.
autocmd FileType python autocmd! BufWritePost <buffer> call Flake8()
