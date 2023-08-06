local P = {"nvim-lualine/lualine.nvim"}

P.event = "VeryLazy"

P.config = function()
  local lualine = require("lualine")
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
      icons_enabled = true,
      icon = "ᛋ",
      fmt = statusline.truncate_branch,
    },
  }

  H.lualine_c = {
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
    },
    {
      H.get_updated,
      cond = require("lazy.status").has_updates,
      icons_enabled = true,
      icon = "⟳",
      color = {fg = "#ff9e64"},
    },
  }

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
    extensions = {"fzf", "nvim-tree", "lazy"},
  })
end

return P
