" Use current background color
set t_ut=""

" Be quiet
set vb t_vb=""

" Setup 256 color terminals
if ($TERM =~ "256color" || $TERM == "screen")
    set t_Co=256
" Fallback for tty terminals
elseif ($TERM == "xterm" || $TERM == "linux")
    set t_Co=8
endif

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
