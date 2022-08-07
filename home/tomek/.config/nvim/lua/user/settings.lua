-- Default settings

vim.opt.encoding = 'utf8'
vim.opt.expandtab = true
vim.opt.smarttab = true

vim.opt.incsearch = true        -- Incremental search
vim.opt.hlsearch = true         -- Highlight search results.
vim.opt.ignorecase = true       -- Do case insensitive matching
vim.opt.smartcase = true        -- Do smart case matching

vim.opt.showcmd = true          -- Show (partial) command in status line.
vim.opt.laststatus = 2          -- Always display statusbar
vim.opt.wildmenu = true         -- Use wildmenu
vim.opt.wildmode = 'full:longest'
vim.opt.wildoptions = 'tagfile'

vim.opt.wrap = true             -- Line wrapping
vim.opt.linebreak = true        -- Wrap long lines at a linebreak character
vim.opt.wrapscan =  false       -- Search wrapping

vim.opt.smartindent = true      -- Try to be smart with indenting
vim.opt.autoindent = true       -- Set global autoindent on
vim.opt.expandtab = true        -- Expand tabs to spaces
vim.opt.smarttab = true         -- Smart tab
vim.opt.shiftwidth = 4          -- Set default tabs behavior
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

vim.opt.hidden = true           -- Hide buffer instead of closing it

vim.opt.lazyredraw = true       -- Don't redraw the screen when not needed
vim.opt.ttyfast = true          -- Faster scrolling
vim.opt.ttimeout = true         -- Time waited for key press(es) to complete, faster key response
vim.opt.timeout = true          -- Setting for mappings
vim.opt.timeoutlen = 1000       -- Set to default value
vim.opt.ttimeout = true         -- Setting for key codes
vim.opt.ttimeoutlen = 10        -- Set to unnoticeable small value
vim.opt.updatetime = 300        -- Longer update time leads to noticeable delays
vim.opt.synmaxcol = 512         -- Be forgiving with long lines

vim.opt.clipboard = 'unnamedplus' -- Use the "global" buffer for copy and paste
vim.opt.undofile = true         -- Enable persistent undo
vim.opt.modeline = false        -- Don't run arbitrary modeline code
vim.opt.inccommand = 'nosplit'  -- Shows the effects of a command incrementally.
vim.g.netrw_banner = 0          -- Netrw settings

vim.opt.formatoptions:remove("c")   -- Disable automatic comment insertion
vim.opt.formatoptions:remove("r")
vim.opt.formatoptions:remove("o")
vim.opt.shortmess:append("c")       -- Shut off completion messages
vim.opt.complete:remove("i")        -- Prevent a condition where vim lags due to searching include files and tags
vim.opt.complete:remove("t")
vim.opt.completeopt = {'menu', 'menuone', 'noinsert'}

vim.opt.diffopt:append('algorithm:patience') -- Diff settings
vim.opt.diffopt:append('indent-heuristic')