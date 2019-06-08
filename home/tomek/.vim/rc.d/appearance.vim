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
    highlight CursorColumn term=reverse ctermbg=8
    highlight DiffAdd      term=bold ctermfg=42 ctermbg=24
    highlight DiffDelete   term=bold ctermfg=42 ctermbg=24
    highlight DiffChange   term=bold ctermfg=42 ctermbg=24
    highlight DiffText     term=bold ctermfg=42 ctermbg=126
endif

" Signify colors for dark theme
if (&background == 'dark')
    highlight SignColumn        ctermbg=NONE cterm=NONE
    highlight SignifySignAdd    cterm=bold ctermbg=none ctermfg=119
    highlight SignifySignDelete cterm=bold ctermbg=none ctermfg=167
    highlight SignifySignChange cterm=bold ctermbg=none ctermfg=227
endif

" Signify colors for light theme
if (&background == 'light')
    highlight SignColumn        ctermbg=NONE cterm=NONE
    highlight SignifySignAdd    cterm=bold ctermbg=NONE ctermfg=28
    highlight SignifySignDelete cterm=bold ctermbg=NONE ctermfg=124
    highlight SignifySignChange cterm=bold ctermbg=NONE ctermfg=166
endif

" Set vertical column
if exists('+colorcolumn')
    set colorcolumn=80
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
