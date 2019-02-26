" Generate help for plugins
helptags ~/.vim/pack/git-plugins/start/bufexplorer/doc
helptags ~/.vim/pack/git-plugins/start/ctrlp.vim/doc
helptags ~/.vim/pack/git-plugins/start/neocomplete.vim/doc
helptags ~/.vim/pack/git-plugins/start/vim-colors-solarized/doc
helptags ~/.vim/pack/git-plugins/start/vim-commentary/doc
helptags ~/.vim/pack/git-plugins/start/vim-easy-align/doc
helptags ~/.vim/pack/git-plugins/start/vim-fugitive/doc
helptags ~/.vim/pack/git-plugins/start/vim-signify/doc
helptags ~/.vim/pack/git-plugins/opt/csv.vim/doc

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

" Lightline
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }

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

" CSV
let g:csv_highlight_column = 'y'

" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
nmap <Leader>a <Plug>(EasyAlign)

" Signify
let g:signify_vcs_list = [ 'git' ]

" Flake8
let g:flake8_show_in_gutter = 1
