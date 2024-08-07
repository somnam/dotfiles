return {
  {
    "Mofiqul/vscode.nvim",
    event = "ColorSchemePre vscode",
    opts = {
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
}
