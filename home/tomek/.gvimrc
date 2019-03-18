" Background style
set background=dark
" set background=light

" Dark theme
if (&background == 'dark')
    colorscheme one
" Light theme
elseif (&background == 'light')
    colorscheme pyte
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
