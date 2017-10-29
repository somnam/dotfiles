" Enable pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

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

" Set 256 color themes
if ($TERM == "xterm-256color" || $TERM == "screen")
    set t_Co=256
    set background=light
    colo solarized
" Regular color theme
elseif $TERM == "xterm"
    set t_Co=8
    set background=light
    colo default
" Fallback for tty terminals
elseif $TERM == "linux"
    set t_Co=8
    set background=dark
endif

" Be quiet
set vb t_vb=""

" Set vertical column
if exists('+colorcolumn')
    set colorcolumn=80
endif
" Set line highlight
if exists('+cursorline')
    set cursorline
endif

" Set backup directory
set backupdir=~/.vim/backup,/var/tmp

" Set swap dir
set directory=~/.vim/swap,/var/tmp

" Set default tabs behavior
set shiftwidth=4 tabstop=4 softtabstop=4

if has("autocmd")
    " Uncomment the following to have Vim jump to the last position when
    " reopening a file
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

    " Open PDF files
    " autocmd BufReadPost *.pdf silent %!pdftotext -nopgbrk "%" - |fmt -csw80
    " autocmd FileType pdf setlocal ro nowrap syntax=text

    " Indentation settings:
    "     tabstop     : n-space tab width
    "     shiftwidth  : shift width with < and > for VISUAL indenting
    "     softtabstop : count n spaces when DELETE or <BS> is used
    autocmd FileType html,htmldjango,xhtml,xml,xslt,eruby,ruby,haml,yaml,erb setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType c,cpp,h,perl,python,css,javascript,java setlocal shiftwidth=4 tabstop=4 softtabstop=4
    autocmd FileType lisp,scheme setlocal shiftwidth=2 tabstop=8 softtabstop=2

    " Disable automatic comment insertion
    autocmd FileType javascript,java,lisp,scheme,perl,python,ruby,vim,c setlocal formatoptions-=c formatoptions-=r formatoptions-=o

    " Python - don't show docs in preview window
    autocmd FileType python setlocal completeopt-=preview nosmartindent

    " Wrapping in CSV
    autocmd FileType csv setlocal wrap
endif

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
set history=200     " Keep 100 lines of command line history
set expandtab       " Expand tabs to spaces
set smarttab        " Smart tab
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
set list                                      " Display whitespace info
set listchars=tab:>.,trail:.,extends:#,nbsp:. " Display tab characters, trailing
                                              " whitespace, visible spaces and
                                              " mark lines that extend off-screen
let mapleader=","   " Change the mapleader from \ to ,

" Key mappings

" Move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Tabs
map <A-Left> :tabp<Enter>
map <A-Right> :tabn<Enter>

" Move vertically by visual line
nnoremap j gj
nnoremap k gk

" Session
command! SS SessionSave
command! SC SessionClose
command! SL SessionList

" BufferExpolorer
command! LS BufExplorer
command! LH BufExplorerHorizontalSplit
command! LV BufExplorerVerticalSplit

" Airline
let g:airline_theme='sol'
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#whitespace#checks = ['indent']

" CtrlP
" Files limit
let g:ctrlp_max_files = 100000
" Search only by filename
let g:ctrlp_by_filename = 1
" Search in regexp mode
let g:ctrlp_regexp = 1
" Results window height
let g:ctrlp_max_height = 15
" Ignore vcs folders
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" Custom update
let g:ctrlp_lazy_update = 1
" Custom search command
let g:ctrlp_user_command = {
    \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files'],
        \ },
    \ 'fallback': 'find %s -type f'
    \ }

" CSV
let g:csv_highlight_column = 'y'

" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
nmap <Leader>a <Plug>(EasyAlign)

" Gitgutter
let g:gitgutter_realtime = 0
let g:gitgutter_escape_grep = 1
let g:gitgutter_max_signs = 3000
let g:gitgutter_override_sign_column_highlight = 1
