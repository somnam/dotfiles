" Completion options
set completeopt=menu,menuone,noinsert
set pumheight=15

" Deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option({
    \ 'auto_complete_delay': 50,
    \ 'refresh_always': v:false,
    \ })

augroup deoplete_buffer_opt
    au!
    au FileType python call deoplete#custom#buffer_option({
        \ 'skip_chars': ['(', ')', '{', '}', '[', ']', '"', "'", ':', ","],
        \ })
    au FileType rust call deoplete#custom#buffer_option({
        \ 'skip_chars': ['(', ')', '{', '}', '[', ']', '"', "'", ";", ","],
        \ })
augroup END
