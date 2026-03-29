let g:json_config = util#file#ReadJsonFile(expand("~/.vim/.config.json"))

fun! util#config#Get(key, ...) abort
    let l:default = a:0 > 0 ? a:1 : v:null
    let l:keys = split(a:key, '\.')

    let l:value = g:json_config
    for l:k in l:keys
        let l:value = get(l:value, l:k, v:null)
        if l:value is v:null
            return l:default
        endif
    endfor

    return l:value
endfun

fun! util#config#Setup() abort
    exe "set bg=" . util#config#Get("background", "dark")
    exe "silent! colorscheme " . util#config#Get("colorscheme", "default")
endfun
