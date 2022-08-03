vim.cmd([[
    fun! s:updateTermColors() abort
        if &termguicolors || &background != 'dark'
            return
        endif

        " Set more readable diff colors in terminal
        highlight DiffAdd      term=bold ctermfg=42 ctermbg=24
        highlight DiffDelete   term=bold ctermfg=42 ctermbg=24
        highlight DiffChange   term=bold ctermfg=42 ctermbg=24
        highlight DiffText     term=bold ctermfg=42 ctermbg=126

        " Set git signs colors
        highlight GitSignsAdd    cterm=bold ctermbg=none ctermfg=119
        highlight GitSignsDelete cterm=bold ctermbg=none ctermfg=167
        highlight GitSignsChange cterm=bold ctermbg=none ctermfg=227

        " Set columns colors
        highlight CursorColumn   term=reverse ctermbg=8
        highlight SignColumn     term=none ctermbg=NONE cterm=NONE
        highlight VertSplit      cterm=bold ctermbg=none ctermfg=8

        " Set status line colors
        highlight StatusLine    cterm=bold ctermfg=255 ctermbg=238
        highlight StatusLineNC  cterm=none ctermfg=250 ctermbg=238
        highlight StatusLineTerm    cterm=bold ctermfg=255 ctermbg=238
        highlight StatusLineTermNC  cterm=none ctermfg=250 ctermbg=238
    endfun

    augroup color_scheme
      autocmd!
      autocmd ColorScheme * call s:updateTermColors()
    augroup END

    colo default
]])
