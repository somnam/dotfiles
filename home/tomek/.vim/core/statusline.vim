" Statusline config

let g:currentmode = {
\ 'n'      : 'Normal',
\ 'no'     : 'N-Operator',
\ 'v'      : 'Visual',
\ 'V'      : 'V-Line',
\ 's'      : 'Select',
\ 'S'      : 'S-Line',
\ 'i'      : 'Insert',
\ 'R'      : 'Replace',
\ 'Rv'     : 'V-Replace',
\ 'c'      : 'Command',
\ 'cv'     : 'Vim Ex',
\ 'ce'     : 'Ex',
\ 'r'      : 'Prompt',
\ 'rm'     : 'More',
\ 'r?'     : 'Confirm',
\ '!'      : 'Shell',
\ 't'      : 'Terminal'
\}
let g:currentmode["\<C-v>"] = 'V-Block'
let g:currentmode["\<C-s>"] = 'S-Block'

fun! CurrentFileInfo() abort
  if &filetype ==# ""
    return ""
  else
    return printf("≋ %s %s", &filetype, &fileformat)
  endif
endfun

fun! CurrentFileSize() abort
  let l:bytes = getfsize(expand("%:p"))

  if l:bytes <= 0
    return ""
  elseif l:bytes < 1024
    return printf("◔ %db", l:bytes)
  elseif l:bytes < 1048576
    return printf("◔ %.2fK", l:bytes / 1024.0)
  elseif l:bytes < 1073741824
    return printf("◔ %.2fM", l:bytes / 1048576.0)
  else
    return printf("◔ %.2fG", l:bytes / 1073741824.0)
  endif
endfun

set statusline=
set statusline+=\ %{get(g:currentmode,mode(),'---')}
set statusline+=\ %{'│'}
set statusline+=\ %f
set statusline+=\ %m
set statusline+=\ %r
set statusline+=%=
set statusline+=\ %{CurrentFileInfo()}
set statusline+=\ %{CurrentFileSize()}
set statusline+=\ %{'│'}
set statusline+=\ %3l:%-2c\ %P
