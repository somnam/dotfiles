" Set vertical column
set colorcolumn=120


fun! s:updateTerminalColors() abort
    if has('gui_running')
        return
    endif

    " Set more readable diff colors in terminal
    highlight CursorColumn term=reverse ctermbg=8
    highlight DiffAdd      term=bold ctermfg=42 ctermbg=24
    highlight DiffDelete   term=bold ctermfg=42 ctermbg=24
    highlight DiffChange   term=bold ctermfg=42 ctermbg=24
    highlight DiffText     term=bold ctermfg=42 ctermbg=126

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
endfun

" Update colors
call s:updateTerminalColors()

" Update colors on ColorScheme change.
augroup ChangeColorScheme
    autocmd!
    autocmd ColorScheme * call s:updateTerminalColors()
augroup END

fun! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

" Statusline config
set statusline=
set statusline+=%f
set statusline+=%m
set statusline+=\ %{LinterStatus()}
set statusline+=%=
set statusline+=\ %y
set statusline+=\ [%{&fileencoding?&fileencoding:&encoding}]
set statusline+=\ [%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
