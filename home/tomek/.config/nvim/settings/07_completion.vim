" Completion options
set completeopt=menu,menuone,noinsert
set pumheight=15

" Deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option({
    \ 'auto_complete_delay': 10,
    \ 'refresh_always': v:false,
    \ })
