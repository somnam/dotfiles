" Move between windows
nnoremap <silent> <C-j> <C-W>j
nnoremap <silent> <C-k> <C-W>k
nnoremap <silent> <C-h> <C-W>h
nnoremap <silent> <C-l> <C-W>l

" Resize windows
nnoremap <silent> <M-Down> :resize +2<Enter>
nnoremap <silent> <M-Up> :resize -2<Enter>
nnoremap <silent> <M-Left> :vertical resize -2<Enter>
nnoremap <silent> <M-Right> :vertical resize +2<Enter>

" Move vertically by visual line
nnoremap <silent> j gj
nnoremap <silent> k gk

" Switch tabs
noremap <silent> <S-h> :tabp<Enter>
noremap <silent> <S-l> :tabn<Enter>

" Clear search and update diff
nnoremap <silent> <Esc> :nohlsearch \| diffupdate<Enter>

" Quick fix toggle
nnoremap <silent> <leader>q :execute
    \ empty(filter(range(1, winnr('$')), 'getwinvar(v:val, "&buftype") ==# "quickfix"'))
    \ ? "copen"
    \ : "cclose"<Enter>

" Pop up menu mappings
fun! s:confirm_pum_or_newline() abort
    if pumvisible()
        let info = complete_info()
        return get(info, "selected", -1) != -1 ? "\<C-y>" : "\<C-n>\<C-y>"
    endif
    return "\<CR>"
endfun
inoremap <silent> <expr> <CR> <SID>confirm_pum_or_newline()
