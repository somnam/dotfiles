-- Default options

vim.opt.ignorecase = true -- Do case insensitive matching
vim.opt.smartcase = true -- Do smart case matching
vim.opt.iskeyword:append("-") -- Treat dash separated words as a word text object

vim.opt.title = true -- Show filename in terminal title
vim.opt.wildmode = "full:longest"
pcall(function() vim.opt.wildoptions = "pum,tagfile,fuzzy" end)
vim.opt.wildignore:append({ "*.o", "*.obj", "*.pyc", "*.pyo", "*.class" }) -- Compiled files
vim.opt.wildignore:append({ "*.swp", "*.bak", "*~" }) -- Editor artifacts
vim.opt.wildignore:append({ "*/.git/*", "*/.hg/*", "*/.svn/*" }) -- VCS directories

vim.opt.autowrite = true -- Automatically save before commands like :next and :make
vim.opt.confirm = true -- Prompt to save on :q with unsaved changes
vim.opt.wrap = true -- Line wrapping
vim.api.nvim_create_autocmd("FileType", {
  pattern = "csv",
  callback = function() vim.opt_local.wrap = false end,
})
vim.opt.wrapscan = false -- Search wrapping
vim.opt.linebreak = true -- Wrap lines at 'breakat' char
vim.opt.breakindent = true -- Preserve indentation in wrapped lines
vim.opt.smoothscroll = true -- Scroll by screen line, not logical line
vim.opt.foldmethod = "marker" -- Set folding method
vim.opt.foldenable = false -- No autofold
vim.opt.cursorline = true -- Highlight current line
vim.opt.cursorlineopt = "line"
vim.opt.cursorcolumn = false -- Don't highlight current cursor column
vim.opt.signcolumn = "yes" -- Show sign column
vim.opt.number = true -- Display line numbers
vim.opt.numberwidth = 2 -- Set min. number column width
vim.opt.mouse = "nvi" -- Mouse modes
vim.opt.scrolloff = 5 -- Minimal number of lines around the cursor
vim.opt.jumpoptions = "stack" -- Browser-like jumplist behavior
vim.opt.virtualedit = "block" -- Allow cursor to move past EOL in visual block mode
vim.opt.nrformats:remove("octal") -- Don't treat 007 as octal for <C-a>/<C-x>

vim.opt.expandtab = true -- Expand tabs to spaces
vim.opt.shiftwidth = 4 -- Set default tabs behavior
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

vim.opt.ttimeoutlen = 25 -- Set to unnoticeable small value
vim.opt.updatetime = 300 -- Longer update time leads to noticeable delays
vim.opt.synmaxcol = 1024 -- Be forgiving with long lines

vim.opt.clipboard = "unnamedplus" -- Use the "global" buffer for copy and paste
vim.opt.undofile = true -- Enable persistent undo
vim.opt.list = true -- Display whitespace info
vim.opt.listchars = "tab:>.,trail:.,extends:…,precedes:…,nbsp:␣" -- Display specific characters
vim.opt.fillchars = { eob = " " } -- Display empty fill characters

vim.g.mapleader = " " -- Remap space as leader key

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
vim.opt.formatoptions = "tqjn"
-- Single space after sentence when joining lines
vim.opt.joinspaces = false

-- Completion options
vim.opt.shortmess:append("c")
vim.opt.complete:remove("i") -- Prevent vim lag due to searching include files and tags
vim.opt.complete:remove("t")
vim.opt.pumheight = 15 -- Completion window height
-- Completion behavior
vim.opt.completeopt = { "menu", "menuone", "popup", "noinsert", "noselect" }
pcall(
  function() vim.opt.completeopt = { "menu", "menuone", "popup", "noinsert", "noselect", "fuzzy" } end
)
pcall(function() vim.opt.completeopt:append("nearest") end)

-- Diff settings
vim.opt.diffopt:append("iwhite")
vim.opt.diffopt:append("algorithm:patience")

-- Spell settings
vim.opt.spelloptions = "camel" -- Check CamelCase words
vim.opt.spellsuggest = "double" -- Better suggestions
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("spellcheck", { clear = true }),
  callback = function(args)
    local filetype = vim.bo[args.buf].filetype
    local exclude_filetype = require("util.buffer").exclude_filetype
    if not vim.tbl_contains(exclude_filetype, filetype) then
      vim.opt_local.spell = true
    end
  end,
})

local filetype_group = vim.api.nvim_create_augroup("filetype_settings", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = filetype_group,
  pattern = { "csv", "markdown" },
  callback = function() vim.opt_local.wrap = false end,
})
vim.api.nvim_create_autocmd("FileType", {
  group = filetype_group,
  pattern = { "html", "htmldjango", "xhtml", "xml", "xslt", "haml", "yaml", "erb" },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  group = filetype_group,
  pattern = { "lisp", "scheme", "lua", "ruby" },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  group = filetype_group,
  pattern = { "vim", "lua" },
  callback = function() vim.opt_local.formatoptions = "tqj" end,
})
vim.api.nvim_create_autocmd("FileType", {
  group = filetype_group,
  pattern = "qf",
  callback = function()
    vim.opt_local.wrap = false
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    local opts = { buffer = true, silent = true }
    vim.keymap.set("n", "q", "<cmd>cclose<CR>", opts)
    vim.keymap.set("n", "o", "<CR><cmd>cclose<CR>", opts)
    vim.keymap.set("n", "<C-n>", "<cmd>silent! cnext<CR>", opts)
    vim.keymap.set("n", "<C-p>", "<cmd>silent! cprevious<CR>", opts)
  end,
})

-- Have Vim jump to the last position when reopening a file
vim.api.nvim_create_autocmd("BufReadPost", {
  group = vim.api.nvim_create_augroup("last_position", { clear = true }),
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lnum = mark[1]
    if lnum > 1 and lnum <= vim.api.nvim_buf_line_count(0) then
      vim.cmd([[silent! normal! g'"]])
    end
  end,
})

-- Extend filetype detection with custom definitions
vim.filetype.add({
  extension = {
    gitconfig = "gitconfig",
  },
})
