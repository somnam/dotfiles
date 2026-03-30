" Grep
let s:grep_cmd = 'grep -RIin'
if executable('rg')
  let s:grep_cmd = 'rg --vimgrep --no-heading --smart-case --color=never'
endif
let s:grep_format = '%f:%l:%c:%m,%f:%l:%m'
let &grepprg = s:grep_cmd . ' $*'
let &grepformat = s:grep_format

command! -nargs=1 Grep
    \ call setqflist([], ' ', {
    \   'title': 'Grep: ' . <q-args>,
    \   'lines': systemlist(printf(s:grep_cmd . ' %s', shellescape(<q-args>))),
    \   'efm': s:grep_format
    \ }) | redraw! | copen | if !empty(getqflist()) | cc | endif
nnoremap <silent> <leader>w :exe 'Grep ' . input('Grep: ')<Enter>

" Files
let s:files_cmd = 'find . -not -path "*/.git/*" -type f | grep -i %s'
if executable('rg')
  let s:files_cmd = 'rg --files | rg -i %s'
endif

command! -nargs=1 Files call setqflist([], ' ', {
    \   'title': 'Files: ' . <q-args>,
    \   'items': map(
    \   systemlist(printf(s:files_cmd, shellescape(<q-args>))),
    \   '{ "filename": v:val }'
    \   )
    \ }) | redraw! | copen | if !empty(getqflist()) | cc | endif
nnoremap <silent> <leader>f :exe 'Files ' . input('Files: ')<Enter>

" Cwd history
command! CwdHistory exe
    \ 'filter #' .
    \ escape(fnamemodify(getcwd(), ':~'), '~') .
    \ '# browse oldfiles'
nnoremap <silent> <leader>p :exe 'CwdHistory'<Enter>

" History
command! History browse oldfiles
nnoremap <silent> <leader>P :exe 'History'<Enter>

" Buffers
command! Buffers call setqflist([], ' ', {
    \   'title': 'Buffers',
    \   'items': map(
    \     filter(getbufinfo({'buflisted': 1}),
    \       {_, buf -> getbufvar(buf.bufnr, '&buftype') !~# 'quickfix'}),
    \     {_, buf -> {'bufnr': buf.bufnr, 'lnum': buf.lnum}}
    \   )
    \ }) | copen
nnoremap <silent> <leader>b :exe 'Buffers'<Enter>

" Git diff current file against HEAD
fun! s:git_diff() abort
    let l:ft = &filetype
    let l:content = system('git -C ' . shellescape(expand('%:p:h')) .
        \ ' show HEAD:./' . shellescape(expand('%:p:t')))
    if v:shell_error
        echo 'Not in git or file not tracked'
        return
    endif
    vert new
    setlocal buftype=nofile bufhidden=wipe noswapfile
    let &l:filetype = l:ft
    call setline(1, split(l:content, '\n'))
    exe 'au BufWipeout <buffer> diffoff!'
    diffthis | wincmd p | diffthis
endfun

" Git status of current repo
fun! s:git_status() abort
    let l:root = systemlist('git rev-parse --show-toplevel')
    if v:shell_error || empty(l:root)
        echo 'Not in a git repo'
        return
    endif
    let l:lines = systemlist('git -C ' . shellescape(l:root[0]) .
        \ ' status --porcelain')
    if empty(l:lines)
        echo 'Working tree clean'
        return
    endif
    call setqflist([], ' ', {
        \   'title': 'Git Status',
        \   'items': map(l:lines,
        \     {_, l -> {
        \       'filename': l:root[0] . '/' . trim(split(l[3:], ' -> ')[-1]),
        \       'text': trim(l[:1])
        \     }})
        \ }) | copen
endfun

" Git line blame popup
fun! s:git_line_blame() abort
    let l:blame = systemlist('git -C ' . shellescape(expand('%:p:h')) .
        \ ' blame -L ' . line('.') . ',' . line('.') .
        \ ' --date=short ' . shellescape(expand('%:p:t')))
    if v:shell_error || empty(l:blame)
        return
    endif
    let l:hash = matchstr(l:blame[0], '\x\+')
    if l:hash =~# '^0\+$'
        call popup_atcursor('Not yet committed',
            \ {'moved': 'any', 'padding': [0,1,0,1]})
        return
    endif
    let l:msg = systemlist('git -C ' . shellescape(expand('%:p:h')) .
        \ ' log --format=%s -1 ' . l:hash)
    let l:info = substitute(l:blame[0], '\s\+\d\+).*$', ')', '')
    call popup_atcursor(l:info . (empty(l:msg) ? '' : ' ' . l:msg[0]),
        \ {'moved': 'any', 'padding': [0,1,0,1]})
endfun

command! Gdiff call s:git_diff()
command! Gstatus call s:git_status()
command! Gblame call s:git_line_blame()
nnoremap <silent> <leader>gd :Gdiff<Enter>
nnoremap <silent> <leader>gs :Gstatus<Enter>
nnoremap <silent> <leader>gb :Gblame<Enter>
