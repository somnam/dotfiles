" Clear colorscheme
au ColorSchemePre * hi clear | syntax reset

" Link highlights
augroup link_highlights
    au!
    au ColorScheme *
        \ hi! link SignColumn Normal
        \ | hi! link WinBar StatusLine
        \ | hi! link WinBarNC StatusLineNC
augroup END

" Autoresize windows
au VimResized * wincmd =

" Set termgicolors
if exists("$COLORTERM") && ($COLORTERM ==# "truecolor" || $COLORTERM ==# "24bit")
    " Terminal supports true colors
    set termguicolors
endif

" Set cursor shapes for different modes
"  1 -> blinking block
"  2 -> solid block
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar
let &t_SI = "\<Esc>[6 q" "SI = INSERT mode
let &t_SR = "\<Esc>[4 q" "SR = REPLACE mode
let &t_EI = "\<Esc>[2 q" "EI = NORMAL mode
