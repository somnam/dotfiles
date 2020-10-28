" Ale
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_completion_enabled = 0
let g:ale_set_balloons = 0
let g:ale_hover_to_preview = 0
let g:ale_echo_msg_format = '[%severity%] %s'
let g:ale_disable_lsp = 1

let g:ale_linters = {}
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace']}

" Set keyboard shortcuts
map <Leader>] :ALENext<Enter>
map <Leader>[ :ALEPrevious<Enter>
map <Leader>f :ALEFix<Enter>

" Ale Python
let s:python_virtualenv_dir = $HOME . '/.config/nvim/python'
if filewritable(s:python_virtualenv_dir)
    let g:ale_virtualenv_dir_names = [s:python_virtualenv_dir]
    let g:ale_linters.python = ['flake8']
    let g:ale_fixers.python = ['autopep8']
endif

" Ale Rust
let s:rust_fmt_cmd = $HOME . "/.cargo/bin/rustfmt"
if executable(s:rust_fmt_cmd)
    let g:ale_fixers.rust = ['rustfmt']
endif
