" Disable intro message
set shortmess+=I

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
syntax on

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
filetype plugin on
filetype indent on

" Set utf-8 encoding
set encoding=utf8

" Set backup directory
set backupdir=~/.vim/backup,/var/tmp

" Set swap dir
set directory=~/.vim/swap,/var/tmp

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set hlsearch        " Highlight search results.
set nu              " Display line numbers
set showcmd         " Show (partial) command in status line.
set showmatch       " Show matching brackets.
set ignorecase      " Do case insensitive matching
set smartcase       " Do smart case matching
set incsearch       " Incremental search
set autowrite       " Automatically save before commands like :next and :make
set ruler           " Show cursor position all the time
set history=200     " Keep n lines of command line history
set wrap            " Line wrapping
set linebreak       " Wrap long lines at a linebreak character
set nowrapscan      " Search wrapping
set smartindent     " Try to be smart with indenting
set autoindent      " Set global autoindent on
set wildmenu        " Use wildmenu
set wildmode=list:longest
set laststatus=2    " Always display statusbar
set spl=pl          " Use PL dictionary for spelling
set fdm=marker      " Set folding method
set hidden          " Hide buffer instead of closing it
set lazyredraw      " Don't redraw the screen when not needed
set ttyfast         " Faster scrolling
set ttimeout        " Time waited for key press(es) to complete, faster key response
set ttimeoutlen=100 "
set list                                      " Display whitespace info
set listchars=tab:>.,trail:.,extends:#,nbsp:. " Display tab characters, trailing
                                              " whitespace, visible spaces and
                                              " mark lines that extend off-screen
set shiftwidth=4 tabstop=4 softtabstop=4 " Set default tabs behavior
set expandtab                            " Expand tabs to spaces
set smarttab                             " Smart tab
set backspace=indent,eol,start           " Make backspace work like in most programs
set regexpengine=1                       " Use older regexp engine
set synmaxcol=512                        " Be forgiving with long lines
set nomodeline                           " Don't run arbitrary modeline code

" Shut off completion messages
set shortmess+=c
" Prevent a condition where vim lags due to searching include files
set complete-=i

" Slows down scroll in vim >= 8.0.
set nocursorcolumn
set nocursorline
set norelativenumber

" Uncomment the following to have Vim jump to the last position when
" reopening a file
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Indentation settings:
"     tabstop     : n-space tab width
"     shiftwidth  : shift width with < and > for VISUAL indenting
"     softtabstop : count n spaces when DELETE or <BS> is used
autocmd FileType html,htmldjango,xhtml,xml,xslt,eruby,ruby,haml,yaml,erb setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType c,cpp,h,perl,python,css,javascript,java setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType lisp,scheme setlocal shiftwidth=2 tabstop=8 softtabstop=2

" Go tabs setup and formatting
autocmd FileType go setlocal shiftwidth=4 tabstop=4 softtabstop=0 noexpandtab
autocmd FileType go setlocal listchars=tab:\│\ ,trail:-,extends:>,precedes:<,nbsp:+

" Disable automatic comment insertion
autocmd FileType javascript,java,lisp,scheme,perl,python,ruby,vim,c setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Python - don't show docs in preview window
autocmd FileType python setlocal completeopt-=preview nosmartindent
" Autocomplete for python3 environment
autocmd FileType python setlocal omnifunc=python3complete#Complete

" Wrapping in CSV
autocmd FileType csv setlocal wrap

" QT config files syntax
autocmd BufRead,BufNewFile *.qrc set filetype=xml
autocmd BufRead,BufNewFile *.conf set filetype=config

" Netrw
let g:netrw_banner = 0
let g:netrw_browse_split = 2  " open in vertical window
let g:netrw_altv = 1          " splits to the right
let g:netrw_liststyle = 3     " tree view
