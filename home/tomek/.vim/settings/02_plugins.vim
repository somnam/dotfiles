call plug#begin()
Plug 'dense-analysis/ale'
Plug 'jlanzarotta/bufexplorer'
Plug 'MenBrial/vim-bbye'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'lifepillar/vim-mucomplete'
Plug 'prabirshrestha/vim-lsp'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-python/python-syntax'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'pangloss/vim-javascript'
Plug 'mhinz/vim-signify'
Plug 'dracula/vim', { 'as': 'vim-dracula' }
Plug 'mhinz/vim-startify'
Plug 'wincent/ferret'
Plug 'LunarWatcher/auto-pairs'
call plug#end()

" Generate helptags for all plugins
autocmd VimEnter * silent! helptags ALL
