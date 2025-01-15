return {
  {
    "Mofiqul/vscode.nvim",
    event = "ColorSchemePre vscode",
    opts = {
      disable_nvimtree_bg = true,
      group_overrides = {
        MiniStatuslineModeNormal = { link = "Cursor" },
        MiniStatuslineModeInsert = { link = "DiffChange" },
        MiniStatuslineModeVisual = { link = "DiffAdd" },
        MiniStatuslineModeReplace = { link = "DiffDelete" },
        MiniStatuslineModeCommand = { link = "DiffText" },
        MiniStatuslineModeOther = { link = "IncSearch" },
        MiniStatuslineDevinfo = { link = "StatusLine" },
        MiniStatuslineFilename = { link = "StatusLineNC" },
        MiniStatuslineFileinfo = { link = "StatusLine" },
        MiniStatuslineInactive = { link = "StatusLineNC" },
        NvimTreeFolderName = { link = "Directory" },
        NvimTreeEmptyFolderName = { link = "Directory" },
        NvimTreeOpenedFolderName = { link = "Directory" },
        NvimTreeSymlinkFolderName = { link = "Directory" },
      },
    },
  },
  {
    "rebelot/kanagawa.nvim",
    event = "ColorSchemePre kanagawa",
    opts = {
      keywordStyle = { italic = false },
      statementStyle = { bold = false },
      colors = {
        theme = {
          all = { ui = { bg_gutter = "none" } },
        },
      },
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    event = "ColorSchemePre catppuccin",
  },
  {
    "sainnhe/gruvbox-material",
    event = "ColorSchemePre gruvbox-material",
    config = function()
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_show_eob = 0
      vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
      vim.g.gruvbox_material_float_style = "dim"
      vim.g.gruvbox_material_current_word = "high contrast background"
      vim.cmd.colorscheme("gruvbox-material")
    end,
  },
  {
    "sainnhe/everforest",
    event = "ColorSchemePre everforest",
    config = function()
      vim.g.everforest_background = "hard"
      vim.g.everforest_colors_override = { ["bg0"] = { "#272e33", "234" } }
      vim.g.everforest_show_eob = 0
      vim.g.everforest_diagnostic_virtual_text = "colored"
      vim.g.everforest_float_style = "dim"
      vim.g.everforest_current_word = "high contrast background"
      vim.cmd.colorscheme("everforest")
    end,
  },
}
