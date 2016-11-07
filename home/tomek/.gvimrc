" Dark background
" set background=dark

" Light background
set background=light

" Theme
let g:solarized_contrast='high'
colorscheme solarized
let g:airline_theme='solarized'
:AirlineRefresh
set gfn=Hack\ 10

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

" Be quiet
set vb t_vb=""

" Disable Cursor blink
set guicursor+=a:blinkon0
