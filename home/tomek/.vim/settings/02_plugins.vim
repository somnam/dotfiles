call plug#begin()
Plug 'dense-analysis/ale'
Plug 'jlanzarotta/bufexplorer'
Plug 'moll/vim-bbye'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'lifepillar/vim-mucomplete'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-python/python-syntax'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'pangloss/vim-javascript'
Plug 'mhinz/vim-signify'
Plug 'hzchirs/vim-material'
Plug 'wincent/ferret'
call plug#end()

" Generate helptags for all plugins
autocmd VimEnter * silent! helptags ALL
