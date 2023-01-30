local P = {"nvim-lualine/lualine.nvim"}

P.config = function()
  local lualine = require("lualine")
  local statusline = require("util.statusline")

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
      symbols = {error = "🄴 ", warn = "🅆 ", hint = "🄷 ", info = "🄸 "},
    },
  }

  H.lualine_c = {}

  H.lualine_x = {"encoding", "fileformat", "filetype"}

  H.lualine_z = {"searchcount", "location"}

  H.winbar_c = {{"filename", file_status = true, path = 1}}

  H.winbar_x = {"filetype"}

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
          "toggleterm",
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
      lualine_x = H.winbar_x,
    },
    inactive_winbar = {
      lualine_c = H.winbar_c,
      lualine_x = H.winbar_x,
    },
  })
end

return P
