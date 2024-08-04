local buffer = require("core.buffer")
local config = require("core.config")
local statusline = require("core.statusline")
local clients = require("util.clients")

local H = {}

H.get_updates_count = function()
  local checker = require("lazy.manage.checker")
  return #checker.updated
end

H.winbar_c = {
  { "filename", file_status = true, path = 1 },
}

return {
  "nvim-lualine/lualine.nvim",
  event = "UIEnter",
  opts = {
    options = {
      theme = config.plugin.lualine.theme or "auto",
      component_separators = "",
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        winbar = buffer.exclude.filetype,
      },
      refresh = {
        statusline = 2000,
        tabline = 2000,
        winbar = 20000,
      },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = {
        "branch",
        "diff",
        {
          "diagnostics",
          symbols = { error = "✖ ", warn = "▲ ", info = "● ", hint = "⚑ " },
        },
      },
      lualine_c = {},
      lualine_x = {},
      lualine_y = {
        {
          H.get_updates_count,
          cond = require("lazy.status").has_updates,
          icon = "↓",
          color = { fg = "#ff9e64" },
        },
        {
          "fileformat",
          symbols = {
            unix = "unix",
            dos = "dos",
            mac = "mac",
          },
        },
        "filetype",
        {
          clients.get_clients_string,
          cond = clients.has_clients,
          icon = "●",
        },
      },
      lualine_z = {
        { statusline.location, padding = { left = 1, right = 0 } },
        "progress",
      },
    },
    inactive_sections = {
      lualine_c = {},
      lualine_x = {},
    },
    winbar = {
      lualine_c = H.winbar_c,
    },
    inactive_winbar = {
      lualine_c = H.winbar_c,
    },
    extensions = { "fzf", "lazy", "mason", "oil", "quickfix" },
  },
}
