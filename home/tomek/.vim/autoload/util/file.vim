fun! util#file#PathSeparator() abort
    return has("win32") == 1 ? ";" : ":"
endfun

fun! util#file#ReadJsonFile(...) abort
  let l:file = a:0 > 0 ? a:1 : v:null
  if !filereadable(l:file)
    return {}
  endif

  let l:json_text = join(readfile(l:file), '')
  return json_decode(l:json_text)
endfun
