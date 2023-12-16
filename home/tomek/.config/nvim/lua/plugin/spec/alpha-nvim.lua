return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  init = function()
    vim.cmd("autocmd FileType alpha setlocal nofoldenable")
  end,
  opts = function()
    local dashboard = require("alpha.themes.dashboard")
    local misc = require("util.misc")

    local H = {}

    H.labels = {
      find_recent = "  Recent files",
      find_file = "󰈞  Find files",
      find_word = "󰈬  Find in files",
      new_file = "  New file",
      plugins = "󰒲  Plugins",
      quit = "󰅚  Quit",
    }

    H.header = function()
      local blank = ""
      return {blank, misc.nvim_version(), blank}
    end

    dashboard.section.header.val = H.header()
    dashboard.section.buttons.val = {
      dashboard.button("<Leader> p ", H.labels.find_recent , ":FzfLua oldfiles cwd_only=true<Enter>"),
      dashboard.button("<Leader> f ", H.labels.find_file, ":FzfLua files<Enter>"),
      dashboard.button("<Leader> w ", H.labels.find_word, ":FzfLua live_grep<Enter>"),
      dashboard.button("<Leader> n ", H.labels.new_file , ":enew<Enter>"),
      dashboard.button("<Leader> z ", H.labels.plugins , ":Lazy<Enter>"),
      dashboard.button("<Leader> q ", H.labels.quit, ":qa<Enter>"),
    }
    return dashboard.opts
  end
}
