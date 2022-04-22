" Signify
let g:signify_vcs_list = [ 'git' ]
let g:signify_priority = 5

" Update signs only on buffer write
autocmd User SignifyAutocmds autocmd! signify CursorHold,CursorHoldI,FocusGained
