" Disable python2 support
let g:loaded_python_provider = 0
" Set python3 path
let g:python3_host_prog = $HOME . "/.local/share/nvim/python/bin/python"

call plug#begin()
Plug 'dense-analysis/ale'
Plug 'jlanzarotta/bufexplorer'
Plug 'MenBrial/vim-bbye'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'lighttiger2505/deoplete-vim-lsp'
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
call plug#end()

" Generate helptags for all plugins
autocmd VimEnter * silent! helptags ALL
