local available, alpha = pcall(require, "alpha")
if not available then return end

local dashboard = require("alpha.themes.dashboard")
local starter = require("utils.starter")

-- autocmd
vim.cmd("autocmd FileType alpha setlocal nofoldenable")

-- setup
dashboard.section.header.val = starter.header()
dashboard.section.buttons.val = {
    dashboard.button("<Leader> p ", "▶ Recent files" , ":FzfLua oldfiles cwd_only=true<Enter>"),
    dashboard.button("<Leader> f ", "▶ Find files", ":FzfLua files<Enter>"),
    dashboard.button("<Leader> w ", "▶ Find in files", ":FzfLua live_grep<Enter>"),
    dashboard.button("<Leader> n ", "▶ New file" , ":enew<Enter>"),
    dashboard.button("<Leader> q ", "▶ Quit", ":qa<Enter>"),
}
alpha.setup(dashboard.opts)
