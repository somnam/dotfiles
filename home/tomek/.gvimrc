" Background style
set background=dark
" set background=light

" Dark theme
if (&background == 'dark')
    colorscheme one
" Light theme
elseif (&background == 'light')
    colorscheme PaperColor
endif

" Signify colors for light theme
if (&background == 'light')
    highlight SignColumn        gui=NONE guibg=NONE
    highlight SignifySignAdd    gui=bold guibg=NONE guifg=#008700
    highlight SignifySignDelete gui=bold guibg=NONE guifg=#af0000
    highlight SignifySignChange gui=bold guibg=NONE guifg=#d75f00
endif

" Set font
set gfn=Hack\ 10

" Be quiet
set vb t_vb=""

" Remove toolbar
set guioptions-=T

" Remove scroolbar
set guioptions-=L
set guioptions-=l
set guioptions-=R
set guioptions-=r
set guioptions-=b

" Remove menu
set guioptions-=m

" Disable Cursor blink
set guicursor+=a:blinkon0
