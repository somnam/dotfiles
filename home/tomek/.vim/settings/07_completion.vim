" Completion options
set completeopt=menu,menuone,noinsert
set pumheight=15

" Mucomplete
let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#completion_delay = 50
let g:mucomplete#reopen_immediately = 0
let g:mucomplete#chains = {}
let g:mucomplete#chains.default  = ['keyn', 'c-p', 'omni', 'dict', 'path']
let g:mucomplete#chains.python   = {
            \"pythonString": ['keyn', 'c-p', 'dict', 'path'],
            \"pythonComment": ['keyn', 'c-p', 'dict', 'path'],
            \}
let g:mucomplete#chains.sql      = ['keyn', 'c-p', 'dict', 'path']
let g:mucomplete#chains.vim      = ['cmd', 'keyn', 'c-p', 'path']

" Python omni completion regex.
let s:omni_py = { t -> t =~# '\m\%(\k\.\|^\s*from\s.\+import\s\k\)$' }
let s:omni_rust = { t -> t =~# '\m\%(\k::\|\.\)$' }
let g:mucomplete#can_complete = {}
let g:mucomplete#can_complete.python = { 'omni': s:omni_py }
let g:mucomplete#can_complete.rust = { 'omni': s:omni_rust }
