local statusline = require("util.statusline")
local lsp = require("util.lsp")

local H = {}

H.get_updated = function()
  local checker = require("lazy.manage.checker")
  return #checker.updated
end

H.lualine_b = {
  {
    "branch",
    fmt = statusline.truncate_branch,
  },
}

H.lualine_c = {
  "diff",
  {
    "diagnostics",
    symbols = { error = "󰅚 ", warn = "󰀪 ", info = "󰋽 ", hint = "󰌶 " }
  },
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
}

H.lualine_x = { "encoding", "fileformat", "filetype" }

H.lualine_z = { "searchcount", statusline.location }

H.winbar_c = {
  { "filename", file_status = true, path = 1 },
}

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      theme = "auto",
      component_separators = "",
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        winbar = {
          "help",
          "checkhealth",
          "NvimTree",
          "alpha",
        },
      },
    },
    sections = {
      lualine_b = H.lualine_b,
      lualine_c = H.lualine_c,
      lualine_x = H.lualine_x,
      lualine_z = H.lualine_z,
    },
    inactive_sections = {
      lualine_c = H.lualine_c,
      lualine_x = H.lualine_x,
    },
    winbar = {
      lualine_c = H.winbar_c,
    },
    inactive_winbar = {
      lualine_c = H.winbar_c,
    },
    extensions = { "fzf", "lazy", "nvim-tree", "quickfix" },
  }
}
