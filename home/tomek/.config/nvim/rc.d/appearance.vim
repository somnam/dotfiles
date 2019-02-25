" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
syntax on

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
filetype plugin on
filetype indent on

" Set default colorscheme
colorscheme default

" Set more readable diff colors in terminals
if !has('gui_running')
    highlight DiffAdd    cterm=bold ctermfg=42 ctermbg=24
    highlight DiffDelete cterm=bold ctermfg=42 ctermbg=24
    highlight DiffChange cterm=bold ctermfg=42 ctermbg=24
    highlight DiffText   cterm=bold ctermfg=42 ctermbg=126
endif

" Set vertical column
if exists('+colorcolumn')
    set colorcolumn=80
endif
" Set line highlight
if exists('+cursorline')
    set cursorline
endif

" Set airline theme
let g:airline_theme='onedark'
