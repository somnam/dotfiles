" Disable intro message
set shortmess+=I

" Set utf-8 encoding
set encoding=utf8

" Default settings
set incsearch       " Incremental search
set hlsearch        " Highlight search results.
set nu              " Display line numbers
set ignorecase      " Do case insensitive matching
set smartcase       " Do smart case matching
set autowrite       " Automatically save before commands like :next and :make
set history=2000    " Keep n lines of command line history
set linebreak       " Wrap long lines at a linebreak character
set nowrapscan      " Search wrapping
set smartindent     " Try to be smart with indenting
set autoindent      " Set global autoindent on
set wildmode=full:longest
set fdm=marker      " Set folding method
set hidden          " Hide buffer instead of closing it
set lazyredraw      " Don't redraw the screen when not needed
set ttyfast         " Faster scrolling
set ttimeout        " Time waited for key press(es) to complete, faster key response
set timeout         " Setting for mappings
set timeoutlen=1000 " Set to default value
set ttimeout        " Setting for key codes
set ttimeoutlen=10  " Set to unnoticeable small value
set updatetime=300  " Longer update time leads to noticeable delays
set autoread        " Read file when modified outside Vim
set formatoptions-=cro                        " Disable automatic comment insertion
set list                                      " Display whitespace info
set listchars=tab:>.,trail:.,extends:#,nbsp:. " Display tab characters, trailing
                                              " whitespace, visible spaces and
                                              " mark lines that extend off-screen
set shiftwidth=4 tabstop=4 softtabstop=4 " Set default tabs behavior
set expandtab                            " Expand tabs to spaces
set regexpengine=1                       " Use older regexp engine
set synmaxcol=512                        " Be forgiving with long lines
set nomodeline                           " Don't run arbitrary modeline code
set undofile                             " Enable persistent undo
set clipboard+=unnamedplus               " Use the "global" buffer for copy and paste

" Shut off completion messages
set shortmess+=c
" Prevent a condition where vim lags due to searching tags
set complete-=t
" Completion options
set completeopt=menu,menuone,noinsert
set pumheight=15
" Disable SQL dynamic completion
let g:omni_sql_no_default_maps = 1

" Slows down scroll in vim >= 8.0.
set nocursorcolumn
set nocursorline
set norelativenumber

" Diff settings
set diffopt+=algorithm:patience
set diffopt+=indent-heuristic

" Uncomment the following to have Vim jump to the last position when
" reopening a file
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Indentation settings:
"     tabstop     : n-space tab width
"     shiftwidth  : shift width with < and > for VISUAL indenting
"     softtabstop : count n spaces when DELETE or <BS> is used
autocmd FileType html,htmldjango,xhtml,xml,xslt,eruby,ruby,haml,yaml,erb setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType lisp,scheme setlocal shiftwidth=2 tabstop=8 softtabstop=2

" Disable automatic comment insertion
autocmd FileType vim setlocal formatoptions-=cro

" Go tabs setup and formatting
autocmd FileType go setlocal shiftwidth=4 tabstop=4 softtabstop=0 noexpandtab listchars=tab:\│\ ,trail:-,extends:>,precedes:<,nbsp:+

" Wrapping in CSV
autocmd FileType csv setlocal wrap

" Netrw
let g:netrw_banner = 0
let g:netrw_browse_split = 2  " open in vertical window
let g:netrw_altv = 1          " splits to the right
let g:netrw_liststyle = 3     " tree view
