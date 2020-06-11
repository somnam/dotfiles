" Signify
let g:signify_vcs_list = [ 'git' ]

" Update signs only on buffer write
autocmd User SignifyAutocmds autocmd! signify CursorHold,CursorHoldI,FocusGained
