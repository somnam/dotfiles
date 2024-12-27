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
}
