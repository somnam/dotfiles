" Set backup directory
set backupdir=~/.vim/backup,/var/tmp

" Set swap dir
set directory=~/.vim/swap,/var/tmp

" Set undo dir
set undodir=~/.vim/undo,/var/tmp

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
syntax on           " ENable syntax Highlight
set encoding=utf-8  " Explicit UTF-8 encoding
filetype indent on  " Load indentation rules and plugins
filetype plugin on
set incsearch       " Incremental search
set hlsearch        " Highlight search results.
set ignorecase      " Do case insensitive matching
set smartcase       " Do smart case matching
set iskeyword+=-    " Treat dash separated words as a word text object

set showcmd         " Show (partial) command in status line.
set title           " Show filename in terminal title
set laststatus=2    " Always display statusbar
set wildmenu        " Use wildmenu
set wildmode=full:longest
set wildoptions=pum,tagfile
if has("patch-9.1.0500")
    set wildoptions=pum,tagfile,fuzzy
endif
set wildignore+=*.o,*.obj,*.pyc,*.pyo,*.class  " Compiled files
set wildignore+=*.swp,*.bak,*~                  " Editor artifacts
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*       " VCS directories

set autowrite       " Automatically save before commands like :next and :make
set confirm         " Prompt to save on :q with unsaved changes
set ruler           " Show cursor position all the time
set history=10000   " Keep n lines of command line history

set wrap            " Line wrapping
set nowrapscan      " Search wrapping
set linebreak       " Wrap lines at 'breakat' char
set breakindent     " Preserve indentation in wrapped lines
if has("patch-9.0.0640")
    set smoothscroll    " Scroll by screen line, not logical line
endif
set fdm=marker      " Set folding method
set nofoldenable    " No autofold
set cursorline      " Highlight current line
set cursorlineopt=line
set nocursorcolumn  " Don't highlight current cursor column
set signcolumn=yes  " Show sign column
set number          " Display line numbers
set numberwidth=2   " Set min. number column width
set hidden          " Hide buffer instead of closing it
set mouse=nvi       " Mouse modes
set scrolloff=5     " Minimal number of lines around the cursor
set sidescroll=1    " When using a fast terminal use a small number"
set switchbuf=uselast " Switch to last used buffer
if exists('+jumpoptions')
    set jumpoptions=stack " Browser-like jumplist behavior
endif

set autoindent      " Set global autoindent on
set expandtab       " Expand tabs to spaces
set smarttab        " Smart tab
set shiftwidth=4    " Set default tabs behavior
set tabstop=4
set softtabstop=4
set backspace=indent,eol,start " Make backspace work like in most programs
set virtualedit=block   " Free cursor movement in visual block mode
set nrformats-=octal    " Don't treat 007 as octal for <C-a>/<C-x>
" Indentation settings:
"     tabstop     : n-space tab width
"     shiftwidth  : shift width with < and > for VISUAL indenting
"     softtabstop : count n spaces when DELETE or <BS> is used

set ttyfast         " Faster scrolling
set timeout         " Setting for mappings
set ttimeout        " Time waited for key press(es) to complete, faster key response
set timeoutlen=1000 " Set to default value
set ttimeoutlen=25  " Set to unnoticeable small value
set updatetime=300  " Longer update time leads to noticeable delays
set synmaxcol=1024  " Be forgiving with long lines
set belloff=all     " Disable all bell sounds

set clipboard=unnamedplus   " Use the system clipboard for copy and paste
if has('mac')
    set clipboard=unnamed
endif
set undofile            " Enable persistent undo
set autoread            " Read file when modified outside Vim
set list                " Display whitespace info
set display=lastline    " Show partial long lines instead of @@@
" Display tab characters, trailing whitespace, visible spaces and mark lines that extend off-screen
set listchars=tab:>.,trail:.,extends:#,precedes:#,nbsp:~
" Clear empty lines below the end of a buffer
set fillchars=vert:\ ,fold:-,eob:\ ,lastline:@

" Remap space as leader key
let mapleader=" "

" Saving options in session and view files causes more problems than it solves
set sessionoptions-=options
set viewoptions-=options

" Disable unused plugins
let g:loaded_vimball = 1
let g:loaded_vimballPlugin = 1
let g:loaded_getscript = 1
let g:loaded_getscriptPlugin = 1

" Delete comment char when joining lines, disable comment insertion
set formatoptions=tqjn
" Single space after sentence when joining lines
set nojoinspaces

" Completion options
set shortmess+=c
set complete-=i  " Prevent a condition where vim lags due to searching include files
set complete-=t  " and tags
set pumheight=15 " Completion window height
set infercase    " Adjust completion case to match typed text

" Completion behavior
set completeopt=menu,popup,noinsert,noselect
if has("patch-9.1.0500")
    set completeopt=menu,popup,noinsert,noselect,fuzzy
endif

" Autocompletion behavior
if has("patch-9.1.1590")
    set autocomplete
    set complete=.^10,w^10,b^10,u^10
    set autocompletetimeout=100
endif

" Diff settings
if has('mac') && $VIM == '/usr/share/vim'
    set diffopt-=internal
elseif has("patch-8.1.0360")
    set diffopt+=linematch:40
    set diffopt+=iwhite
    set diffopt+=algorithm:patience
    set diffopt+=indent-heuristic
endif

" Spell settings
set spelloptions=camel      " Check CamelCase words
set spellsuggest=double     " Better suggestions

augroup spellcheck
    au!
    " Enable spellcheck for text files
    au FileType text,markdown,rst,gitcommit setlocal spell
    " Enable spellcheck in code comments
    au BufWinEnter * execute(
        \ execute('syntax list') =~# 'Comment.*@Spell\|@Spell.*Comment'
        \ ? 'setlocal spell'
        \ : '')
augroup END

" Filetype-specific settings
augroup filetype_settings
    au!
    au FileType csv setlocal nowrap
    au FileType html,htmldjango,xhtml,xml,xslt,haml,yaml,erb
        \ setlocal shiftwidth=2 tabstop=2 softtabstop=2
    au FileType lisp,scheme,lua,ruby
        \ setlocal shiftwidth=2 tabstop=2 softtabstop=2
    au FileType vim,lua setlocal formatoptions=tqj
    au FileType qf setlocal nowrap nonumber norelativenumber
        \ | nnoremap <buffer> q :cclose<CR>
        \ | nnoremap <buffer> o <CR>:cclose<CR>
        \ | nnoremap <buffer> <C-n> :silent! cnewer<CR>
        \ | nnoremap <buffer> <C-p> :silent! colder<CR>
augroup END

" Jump to last position when reopening a file
augroup last_position
    au!
    au BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$")
        \ | exe "normal! g'\""
        \ | endif
augroup END
