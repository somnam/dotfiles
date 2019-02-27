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

" Signify diff colors
if !has('gui_running')
    highlight SignColumn        ctermbg=NONE cterm=NONE
    highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
    highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
    highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
    highlight SignifySignAdd    cterm=bold ctermbg=none ctermfg=119
    highlight SignifySignDelete cterm=bold ctermbg=none ctermfg=167
    highlight SignifySignChange cterm=bold ctermbg=none ctermfg=227
endif

" Set vertical column
if exists('+colorcolumn')
    set colorcolumn=80
endif
" Set line highlight
if exists('+cursorline')
    set cursorline
endif

" Statusline config
set statusline=
set statusline+=%f
set statusline+=%m
set statusline+=%=
set statusline+=\ %y
set statusline+=\ [%{&fileencoding?&fileencoding:&encoding}]
set statusline+=\ [%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
