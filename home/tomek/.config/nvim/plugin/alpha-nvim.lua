local available, alpha = pcall(require, "alpha")
if not available then return end

local dashboard = require("alpha.themes.dashboard")
local starter = require("utils.starter")
local icon = require("utils.icon").dashboard

-- helper
local H = {}

H.labels = {
  find_recent = icon.find_recent .. "Recent files",
  find_file = icon.find_file .. "Find files",
  find_word = icon.find_word .. "Find in files",
  new_file = icon.new_file .. "New file",
  quit = icon.quit .. "Quit",
}

-- autocmd
vim.cmd("autocmd FileType alpha setlocal nofoldenable")

-- setup
dashboard.section.header.val = starter.header()
dashboard.section.buttons.val = {
    dashboard.button("<Leader> p ", H.labels.find_recent , ":FzfLua oldfiles cwd_only=true<Enter>"),
    dashboard.button("<Leader> f ", H.labels.find_file, ":FzfLua files<Enter>"),
    dashboard.button("<Leader> w ", H.labels.find_word, ":FzfLua live_grep<Enter>"),
    dashboard.button("<Leader> n ", H.labels.new_file , ":enew<Enter>"),
    dashboard.button("<Leader> q ", H.labels.quit, ":qa<Enter>"),
}
alpha.setup(dashboard.opts)
