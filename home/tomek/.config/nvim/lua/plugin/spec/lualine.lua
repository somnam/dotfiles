local P = {"nvim-lualine/lualine.nvim"}

P.config = function()
  local lualine = require("lualine")
  local statusline = require("util.statusline")
  local lsp = require("util.lsp")

  local H = {}

  H.lualine_b = {
    {
      "branch",
      icons_enabled = true,
      fmt = statusline.truncate_branch,
    },
    "diff",
    {
      "diagnostics",
      symbols = {error = "● ", warn = "▲ ", hint = "◆ ", info = "■ "}
    },
    {
      lsp.get_clients_count,
      cond = lsp.has_clients,
      icons_enabled = true,
      icon = "⚙",
      on_click = lsp.show_info,
    }
  }

  H.lualine_c = {}

  H.lualine_x = {"encoding", "fileformat", "filetype"}

  H.lualine_z = {"searchcount", "location"}

  H.winbar_c = {{"filename", file_status = true, path = 1}}

  -- setup
  lualine.setup({
    options = {
      icons_enabled = false,
      theme = "auto",
      component_separators = "",
      disabled_filetypes = {
        winbar = {
          "help",
          "checkhealth",
          "packer",
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
  })
end

return P
