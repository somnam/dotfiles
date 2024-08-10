" Colorscheme
set bg=dark
colo retrobox

" Cursor
set cursorline
set nocursorcolumn
set norelativenumber

" Statusline config
set statusline=
set statusline+=%f
set statusline+=\ %m
set statusline+=\ %r
set statusline+=%=
set statusline+=\ %{&fileformat}
set statusline+=\ %{&filetype}
set statusline+=\ %3l:%-2c
set statusline+=\ %P
