local buffer = require("util.buffer")
local config = require("core.config")
local lsp = require("util.lsp")
local statusline = require("util.statusline")

local H = {}

H.get_updated = function()
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
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        winbar = buffer.exclude.filetype,
      },
      refresh = {
        winbar = 10000,
      },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = {
        "branch",
        "diff",
        {
          "diagnostics",
          symbols = { error = "󰅚 ", warn = "󰀪 ", info = "󰋽 ", hint = "󰌶 " },
        },
      },
      lualine_c = {},
      lualine_x = {},
      lualine_y = {
        {
          lsp.get_clients_count,
          cond = lsp.has_clients,
          icon = " ",
          on_click = lsp.show_info,
        },
        {
          H.get_updated,
          cond = require("lazy.status").has_updates,
          icon = "󰒲 ",
          color = { fg = "#ff9e64" },
          on_click = require("lazy").home,
        },
        "encoding",
        "fileformat",
        "filetype",
      },
      lualine_z = {
        "searchcount",
        "progress",
        { statusline.location, padding = { left = 0, right = 1 } },
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
    extensions = { "fzf", "lazy", "nvim-tree", "quickfix" },
  },
}
