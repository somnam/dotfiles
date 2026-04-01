" Netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_clipboard = 0
let g:netrw_keepdir = 0
let g:netrw_winsize = 20
augroup netrw_filetype
    au!
    au FileType netrw
        \ hi! link netrwMarkFile Search
        \| silent! unmap <buffer> <C-L>
augroup END
nnoremap <silent> <leader>e :Lexplore<Enter>

" Enable optional packages
packadd matchit

if has('patch-9.0.1799')
    packadd editorconfig
endif

if has("patch-9.1.0375")
    packadd comment
endif

if has('patch-9.1.1228')
  let g:hlyank_duration = 300
  packadd hlyank
endif

if has('patch-9.1.1999')
    packadd osc52
    set clipmethod+=osc52
endif
