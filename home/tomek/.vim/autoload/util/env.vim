let s:virtual_env = $VIRTUAL_ENV
let s:virtual_env_bin = s:virtual_env != '' ? s:virtual_env . '/bin' : ''

fun! util#env#AddPythonVirtualEnvBinToPath() abort
    if !empty($VIRTUAL_ENV)
        let l:path_sep = util#file#PathSeparator()
        let l:virtual_env_bin = $VIRTUAL_ENV . '/bin'
        let $PATH = l:virtual_env_bin . l:path_sep . $PATH
    endif
endfun

fun! util#env#AddMasonBinToPath() abort
    let l:mason_bin = $HOME . '/.local/share/nvim/mason/bin'
    if isdirectory(l:mason_bin)
        let l:path_sep = util#file#PathSeparator()
        let $PATH = l:mason_bin . l:path_sep . $PATH
    endif
endfun
