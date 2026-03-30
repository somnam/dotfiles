" Clear colorscheme and autoresize windows
augroup appearance
    au!
    au ColorSchemePre * hi clear | syntax reset
    au VimResized * wincmd =
augroup END

" Link highlights
augroup link_highlights
    au!
    au ColorScheme *
        \ hi! link SignColumn Normal
        \ | hi! link WinBar StatusLine
        \ | hi! link WinBarNC StatusLineNC
    au ColorScheme sorbet
        \ hi! Statement cterm=bold gui=bold
augroup END

" Set termguicolors
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

" Reset cursor shape to blinking block on exit
augroup cursor_reset
    au!
    au VimLeave * silent !printf '\033[2 q'
augroup END
