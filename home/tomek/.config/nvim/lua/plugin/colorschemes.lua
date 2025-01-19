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
      vim.g.gruvbox_material_better_performance = 1
      vim.cmd.colorscheme("gruvbox-material")
    end,
  },
}
