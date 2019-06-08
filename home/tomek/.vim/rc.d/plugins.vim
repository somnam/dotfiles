" Generate help for plugins
helptags ~/.vim/pack/git-plugins/start/bufexplorer/doc
helptags ~/.vim/pack/git-plugins/start/ctrlp.vim/doc
" helptags ~/.vim/pack/git-plugins/start/completor.vim/doc
helptags ~/.vim/pack/git-plugins/start/vim-commentary/doc
helptags ~/.vim/pack/git-plugins/start/vim-easy-align/doc
helptags ~/.vim/pack/git-plugins/start/vim-fugitive/doc
helptags ~/.vim/pack/git-plugins/start/vim-signify/doc

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

" Use completor
" let g:completor_python_binary = $HOME . "/.pyenv/versions/vim/bin/python3.7"
" let g:completor_complete_options = 'menuone,noinsert'
" let g:completor_completion_delay = 100

" Use simple complete
let g:vsc_tab_complete = 0
let g:vsc_complete_options = 'menu,preview,menuone,noinsert'
let g:vsc_pumheight = 15

" CSV
let g:csv_highlight_column = 'y'

" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
nmap <Leader>a <Plug>(EasyAlign)

" Signify
let g:signify_vcs_list = [ 'git' ]
let g:signify_update_on_bufenter = 1

" Python - syntax highlighting
let g:python_highlight_class_vars = 0
let g:python_highlight_all = 1
let g:python_slow_sync = 0

" Flake8
let g:flake8_show_in_gutter = 1
let g:flake8_cmd = $HOME . "/.pyenv/versions/vim/bin/flake8"
" Validate file using flake8 after each save.
autocmd FileType python autocmd! BufWritePost <buffer> call Flake8()
