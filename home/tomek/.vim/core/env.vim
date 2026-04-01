fun! s:add_python_virtual_env_bin_to_path() abort
    if !empty($VIRTUAL_ENV)
        let l:path_sep = util#file#PathSeparator()
        let l:virtual_env_bin = $VIRTUAL_ENV . '/bin'
        let $PATH = l:virtual_env_bin . l:path_sep . $PATH
    endif
endfun

fun! s:add_mason_bin_to_path() abort
    let l:mason_bin = $HOME . '/.local/share/nvim/mason/bin'
    if isdirectory(l:mason_bin)
        let l:path_sep = util#file#PathSeparator()
        let $PATH = l:mason_bin . l:path_sep . $PATH
    endif
endfun

call s:add_python_virtual_env_bin_to_path()
call s:add_mason_bin_to_path()

