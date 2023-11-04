return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    local starter = require("util.starter")

    local H = {}

    H.labels = {
      find_recent = "  Recent files",
      find_file = "󰈞  Find files",
      find_word = "󰈬  Find in files",
      new_file = "  New file",
      plugins = "󰒲  Plugins",
      quit = "󰅚  Quit",
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
      dashboard.button("<Leader> z ", H.labels.plugins , ":Lazy<Enter>"),
      dashboard.button("<Leader> q ", H.labels.quit, ":qa<Enter>"),
    }
    alpha.setup(dashboard.opts)
  end
}
