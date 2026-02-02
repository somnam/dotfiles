-- Default options

vim.opt.incsearch = true -- Incremental search
vim.opt.hlsearch = true -- Highlight search results.
vim.opt.ignorecase = true -- Do case insensitive matching
vim.opt.smartcase = true -- Do smart case matching
vim.opt.iskeyword:append("-") -- Treat dash separated words as a word text object

vim.opt.showcmd = true -- Show (partial) command in status line.
vim.opt.laststatus = 2 -- Always display statusbar
vim.opt.wildmenu = true -- Use wildmenu
vim.opt.wildmode = "full:longest"
vim.opt.wildoptions = "pum,tagfile"
pcall(function() vim.opt.wildoptions = "pum,tagfile,fuzzy" end)

vim.opt.autowrite = true -- Automatically save before commands like :next and :make
vim.opt.ruler = true -- Show cursor position all the time
vim.opt.history = 10000 -- Keep n lines of command line history

vim.opt.wrap = true -- Line wrapping
vim.api.nvim_create_autocmd("FileType", {
  pattern = "csv",
  callback = function() vim.opt_local.wrap = false end,
})
vim.opt.wrapscan = false -- Search wrapping
vim.opt.foldmethod = "marker" -- Set folding method
vim.opt.foldenable = false -- No autofold
vim.opt.cursorline = true -- Highlight current line
vim.opt.cursorlineopt = "line"
vim.opt.cursorcolumn = false -- Don't highlight current cursor column
vim.opt.signcolumn = "yes" -- Show sign column
vim.opt.number = true -- Display line numbers
vim.opt.numberwidth = 2 -- Set min. number column width
vim.opt.hidden = true -- Hide buffer instead of closing it
vim.opt.mouse = "nvi" -- Mouse modes
vim.opt.scrolloff = 5 -- Minimal number of lines around the cursor

vim.opt.autoindent = true -- Set global autoindent on
vim.opt.expandtab = true -- Expand tabs to spaces
vim.opt.smarttab = true -- Smart tab
vim.opt.shiftwidth = 4 -- Set default tabs behavior
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
-- Set custom tabs behavior
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lisp", "lua", "scheme" },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
  end,
})

vim.opt.ttyfast = true -- Faster scrolling
vim.opt.timeout = true -- Setting for mappings
vim.opt.ttimeout = true -- Time waited for key press(es) to complete, faster key response
vim.opt.timeoutlen = 1000 -- Set to default value
vim.opt.ttimeoutlen = 25 -- Set to unnoticeable small value
vim.opt.updatetime = 1000 -- Longer update time leads to noticeable delays
vim.opt.synmaxcol = 512 -- Be forgiving with long lines

vim.opt.clipboard = "unnamedplus" -- Use the "global" buffer for copy and paste
vim.opt.undofile = true -- Enable persistent undo
vim.opt.autoread = true -- Read file when modified outside Vim
vim.opt.inccommand = "nosplit" -- Shows the effects of a command incrementally.
vim.opt.list = true -- Display whitespace info
vim.opt.listchars = "tab:>.,trail:.,extends:>,precedes:<,nbsp:~" -- Display specific characters
vim.opt.fillchars = { eob = " " } -- Display empty fill characters

-- Saving options in session and view files causes more problems than it solves
vim.opt.sessionoptions:remove("options")
vim.opt.viewoptions:remove("options")

-- Disable unused plugins
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwFileHandlers = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1

-- Disable python plugins support
vim.g.loaded_python3_provider = 0

-- Delete comment char when joining lines, disable comment insertion
vim.opt.formatoptions = "tqj"
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "vim", "lua" },
  callback = function() vim.opt_local.formatoptions = "tqj" end,
})

-- Completion options
vim.opt.shortmess:append("C") -- Shut off completion messages
vim.opt.shortmess:append("c")
vim.opt.complete:remove("i") -- Prevent vim lag due to searching include files and tags
vim.opt.complete:remove("t")
vim.opt.pumheight = 20 -- Completion window height
-- Completion behavior
vim.opt.completeopt = { "menu", "menuone", "popup", "noinsert", "noselect" }
pcall(
  function() vim.opt.completeopt = { "menu", "menuone", "popup", "noinsert", "noselect", "fuzzy" } end
)

-- Diff settings
vim.opt.diffopt:append("iwhite")
vim.opt.diffopt:append("algorithm:patience")
vim.opt.diffopt:append("indent-heuristic")

-- Extend filetype detection with custom definitions
vim.filetype.add({
  extension = {
    gitconfig = "gitconfig",
  },
})
