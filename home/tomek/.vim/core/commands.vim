" Grep
let s:grep_cmd = 'grep -RIin %s'
if executable('rg')
  let s:grep_cmd = 'rg --vimgrep --no-heading --smart-case --color=never %s'
endif
let s:grep_format = '%f:%l:%c:%m,%f:%l:%m'

command! -nargs=1 Grep
    \ call setqflist(
    \   getqflist({
    \     'lines': systemlist(printf(s:grep_cmd, shellescape(<q-args>))),
    \     'efm': s:grep_format
    \   }).items,
    \   'r'
    \ ) | redraw! | copen | if !empty(getqflist()) | cc | endif
nnoremap <silent> <leader>w :exe 'Grep ' . input('Grep: ')<Enter>

" Files
let s:files_cmd = 'find . -type f | grep -i %s'
if executable('rg')
  let s:files_cmd = 'rg --files | rg -i %s'
endif

command! -nargs=1 Files call setqflist(
    \ map(
    \   systemlist(printf(s:files_cmd, shellescape(<q-args>))),
    \   '{ "filename": v:val }'
    \ ),
    \ 'r'
    \ ) | redraw! | copen | if !empty(getqflist()) | cc | endif
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
command! Buffers filter! /\c\(Quickfix\|Location\)/ buffers
nnoremap <silent> <leader>b :exe 'Buffers'<Enter>
